package com.Beam.controller;

import com.Beam.biz.weChatService;
import com.Beam.common.ServerResponse;
import com.Beam.mapper.weChatMapper;
import com.sun.org.apache.xpath.internal.operations.Bool;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/weChat")
public class weChatController {
    @Resource
    com.Beam.biz.weChatService weChatService;

    @ResponseBody
    @RequestMapping(value = "findData")
    public String findData(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");
        String data = (String) par.get("data");


        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("data", data);

        weChatService.findData(paramsMap);

        return null;
    }
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

        Boolean bool = true;
        try {
            bool = weChatService.insertCustomer(paramsMap);
        } catch (Exception e) {
            bool = false;
            e.printStackTrace();
        }
        return bool;
    }
//    查询商家外卖
    @ResponseBody
    @RequestMapping(value = "findMenu")
    public Map<String,Object> findMenu(HttpServletResponse resp) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");
        Map<String,Object> map = null;
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