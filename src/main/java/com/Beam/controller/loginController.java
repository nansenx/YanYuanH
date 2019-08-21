package com.Beam.controller;

import com.Beam.common.ServerResponse;
import com.Beam.po.user;
import com.Beam.utils.DateUtils;
import com.Beam.utils.TimeUtils;
import com.Beam.utils.TokenUtils;
import com.Beam.controller.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class loginController {
    @Resource
    com.Beam.biz.loginService loginService;

    //    验证码
    @RequestMapping(value = "/code")
    public void code(HttpServletRequest req, HttpServletResponse rep) {
        rep.setHeader("Pragma", "No-cache");
        rep.setHeader("Cache-Control", "no-cache");
        rep.setDateHeader("Expires", 0);
        rep.reset();
        com.Beam.controller.ValidateCode vCode = new ValidateCode(120, 50, 4, 150);
        try {
//            看一下QMS的数据库再写。先去吃饭
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    登录
    @ResponseBody
    @RequestMapping(value = "/login")
    public ServerResponse login(HttpServletResponse resp, @RequestBody Map<String,Object> pam) {
        String userName = (String) pam.get("username");
        String passWord = (String) pam.get("password");
//        验证码
        String code = (String) pam.get("code");

//        判断验证码

        if (code == null || "".equals(code)) {
            return ServerResponse.error(201, "验证码错误");
        }
        try {
//            获取数据库code信息
            Map<String, Object> stringObjectMap = loginService.queryRandomCode(code);
            if (stringObjectMap == null) {
                return new ServerResponse(205, "验证码错误", null);
            }
            int code_erify = (int) stringObjectMap.get("code_erify");
            if (code_erify == 1) {
                return new ServerResponse(204, "验证码已使用", null);
            }
            String after_time = (String) stringObjectMap.get("after_time");
            boolean after = TimeUtils.isAfter(DateUtils.getSystemDate(), after_time, DateUtils.format);
            if (after) {
                return new ServerResponse(204, "验证码已过期", null);
            }
            Map<String, Object> upMap = new HashMap<>();
            upMap.put("id", stringObjectMap.get("id"));
            loginService.updateRandomCode(upMap);

            Map<String, Object> rtn = new HashMap<>();
            //账号密码
            user user = (com.Beam.po.user) loginService.findUserById(userName);
            if (user == null) {
                return ServerResponse.error(202, "用户不存在");
            }
            String user_pwd = user.getPassword();
            if (!passWord.equals(user_pwd)) {
                return ServerResponse.error(203, "密码错误");
            }
            rtn.put("token", TokenUtils.getToken(user));
            return new ServerResponse(200, "登录成功", rtn);

        } catch (Exception e) {
            e.printStackTrace();
            return ServerResponse.error(201, "出现异常");
        }

    }

}