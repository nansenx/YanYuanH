package com.Beam.controller;

import com.Beam.utils.DatePrimaryKey;
import com.Beam.utils.DateUtils;
import com.Beam.utils.PingYinUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        paramsMap.put("addTime", DateUtils.getSystemDate());

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
    
        Integer totalNum = (Integer) par.get("totalNum");
        Integer totalPrice = (Integer) par.get("totalPrice");
        String cusPhone = (String) par.get("userPhone");
        String remark = (String) par.get("remark");
        String orderTime = DateUtils.getSystemDate();
        String idKey = DatePrimaryKey.getDatePrimaryKey();
    
        if(remark.equals("") || remark.equals("无")){
            remark = "无备注";
        }
        
        List order = (List) par.get("order");
        Map<String, Object> paramsMap = new HashMap<>();
        for (int i = 0; i < order.size(); i++) {
            Map<String, Object> mapp = (Map<String, Object>) order.get(i);
                if (i == 0) {
                    try {
                        paramsMap.put("merchant", mapp.get("merchants"));
                        paramsMap.put("foodName", mapp.get("name"));
                        paramsMap.put("foodNum", mapp.get("num"));
                        paramsMap.put("foodPrice", mapp.get("price"));
                        paramsMap.put("idKey", idKey);
                        paramsMap.put("totalNum", totalNum);
                        paramsMap.put("totalPrice", totalPrice);
                        paramsMap.put("cusPhone", cusPhone);
                        paramsMap.put("remark", remark);
                        paramsMap.put("orderTime", orderTime);
                        weChatService.insertOrder(paramsMap);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "server have been error";
                    }
                    
                }else{
                    try {
                        paramsMap.put("merchant", mapp.get("merchants"));
                        paramsMap.put("foodName", mapp.get("name"));
                        paramsMap.put("foodNum", mapp.get("num"));
                        paramsMap.put("foodPrice", mapp.get("price"));
                        paramsMap.put("idKey", idKey);
                        paramsMap.put("totalNum", totalNum);
                        paramsMap.put("totalPrice", totalPrice);
                        paramsMap.put("cusPhone", cusPhone);
                        paramsMap.put("remark", remark);
                        paramsMap.put("orderTime", orderTime);
                        weChatService.insertOrder(paramsMap);
                    } catch (Exception e) {
                        e.printStackTrace();
                        return "server have been error";
                    }
                }
        }
        return idKey;
    }

    //    查询商家详情页
    @ResponseBody
    @RequestMapping(value = "findMerchant")
    public List<Map<String,Object>> findMerchant(HttpServletResponse resp, @RequestBody Map<String, Object> par) {
        resp.setContentType("text/json");
        resp.setCharacterEncoding("utf-8");

        String merchantName = (String) par.get("merchant_name");
        String dataBase = PingYinUtils.getPingYin(merchantName);
        
        Map<String, Object> paramsMap = new HashMap<>();
        paramsMap.put("merchantName", merchantName);
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
    
//    安全登录
    @RequestMapping("/findAdmin")
    public String findAdmin(HttpServletResponse response, HttpServletRequest request, Model model) {
        String userName;
        String password;
        String myUserName = "admin";
        String myPassword = "#include1514";
        
        try {
            userName = request.getParameter("username");
            password = request.getParameter("password");
            if (userName.equals(myUserName) && password.equals(myPassword)) {
                return "index";
            }else{
                request.setAttribute("message", "账号密码错误，请重新登录<br>");
                return "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "500";
        }
       
    }

//  通过keyId查询订单信息

    @ResponseBody
    @RequestMapping("/findOrderByKeyId")
    public List<Map<String,Object>> findOrderByKeyId(@RequestBody Map<String, Object> par) {
        
        String keyId = (String) par.get("keyId");
        List<Map<String,Object>> map = null;
    
        try {
            map = weChatService.findOrderByKeyId(keyId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
    

}