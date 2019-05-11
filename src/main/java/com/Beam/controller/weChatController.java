package com.Beam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/weChat")
public class weChatController {
    @Resource
    com.Beam.biz.weChatService weChatService;

//    添加用户信息
    @ResponseBody
    @RequestMapping(value = "insertCustomer")
    public Boolean insertCustomer(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");

        String userName = (String) par.get("userName");
        String userSex = (String) par.get("userSex");
        String userRoom = (String) par.get("userRoom");
        String userPhone = (String) par.get("userPhone");

        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("userName", userName);
        paramsMap.put("userSex", userSex);
        paramsMap.put("userRoom", userRoom);
        paramsMap.put("userPhone", userPhone);

        try {
            weChatService.insertCustomer(paramsMap);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
//    查询商家外卖
    @ResponseBody
    @RequestMapping(value = "findMenu")
    public Map<String,Object> findMenu(HttpServletResponse resp) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");
        Map<String,Object> map;
        Map<String, Object> hasMap = new HashMap<>();
        try {
            map = weChatService.findMenu();
            hasMap.put("merchants", map);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return  hasMap;
    }

}