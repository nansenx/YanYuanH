package com.Beam.controller;

import com.Beam.utils.DateUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/weChat")
public class weChatController {
    @Resource
    com.Beam.biz.weChatService weChatService;

//    添加用户信息
    @ResponseBody
    @RequestMapping(value = "insertCustomer")
    public String insertCustomer(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
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
            return "server had been error";
        }
        return "server had been success";
    }

//    查询商家页
    @ResponseBody
    @RequestMapping(value = "findMenu")
    public List<Map<String,Object>> findMenu(HttpServletResponse resp) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");
        List<Map<String,Object>> map = null;
        Map<String, Object> hasMap = new HashMap<>();
        try {
            map = weChatService.findMenu();
            hasMap.put("merchants", map);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    //    添加订单信息
    @ResponseBody
    @RequestMapping(value = "insertOrder")
    public String insertOrder(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");



        String userName = (String) par.get("userName");
        String userSex = (String) par.get("userSex");
        String userRoom = (String) par.get("userRoom");
        String userPhone = (String) par.get("userPhone");
        String orderMenu = (String) par.get("orderMenu");
        String remark = (String) par.get("remark");
        String orderMerchant = (String) par.get("orderMerchant");
        String orderMoney = (String) par.get("orderMoney");
        String orderTime = DateUtils.getSystemDate();

        if(remark.equals("") || remark.equals("无")){
            remark = "无备注";
        }

        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("userName", userName);
        paramsMap.put("userSex", userSex);
        paramsMap.put("userRoom", userRoom);
        paramsMap.put("userPhone", userPhone);
        paramsMap.put("orderTime", orderTime);
        paramsMap.put("orderMenu", orderMenu);
        paramsMap.put("remark", remark);
        paramsMap.put("orderMerchant", orderMerchant);
        paramsMap.put("orderMoney", orderMoney);

        try {
            weChatService.insertOrder(paramsMap);
        } catch (Exception e) {
            e.printStackTrace();
            return "server had been error";
        }
        return "server had been success";
    }

    //    查询商家详情页
    @ResponseBody
    @RequestMapping(value = "findMerchant")
    public List<Map<String,Object>> findMerchant(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");

        String merchantId = (String) par.get("merchant_id");
        String dataBase = null;

        switch (merchantId) {
            case "1111":
                dataBase = "budaimo";
                break;
            case "1112":
                dataBase = "dapanji";
                break;
                case "1113":
                dataBase = "gaijiaofan";
                break;
            default:
                System.out.println("===================请检查merchantId有没有输入正确=================");
        }

        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("merchantId", merchantId);
        paramsMap.put("dataBase",dataBase);
        List<Map<String, Object>> map = null;

        try {
            map = weChatService.findMerchant(paramsMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    //    查询滚动页
    @ResponseBody
    @RequestMapping(value = "findScrollBar")
    public List<Map<String,Object>> findScrollBar(HttpServletResponse resp) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");
        List<Map<String,Object>> map = null;
        Map<String, Object> hasMap = new HashMap<>();
        try {
            map = weChatService.findScrollBar();
            hasMap.put("ScrollBar", map);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }


    @RequestMapping("/findAdmin")
    public String findAdmin(HttpServletResponse response, HttpServletRequest request, Model model) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");

        String myUserName = "admin";
        String myPassword = "#include1514";

        if (userName.equals(myUserName) && password.equals(myPassword)) {
            return "index";
        }else{
            request.setAttribute("message", "账号密码错误，请重新登录<br>");
        }
        return "fail";
    }

}