package com.Beam.biz.impl;

import com.Beam.biz.weChatService;
import com.Beam.mapper.weChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class weChatListImpl implements weChatService {

    @Autowired
    private weChatMapper wechatMapper;

//    添加用户信息
    @Override
    public Boolean insertCustomer(Map<String, Object> ParamsMap) {
        return wechatMapper.insertCustomer(ParamsMap);
    }

//    查询商家外卖
    @Override
    public List<Map<String,Object>> findMenu() {
        return wechatMapper.findMenu();
    }

//    添加订单信息
    @Override
    public Boolean insertOrder(Map<String, Object> ParamsMap) {
        wechatMapper.insertOrder(ParamsMap);
        return true;
    }

//    查询商家详情页
    @Override
    public List<Map<String,Object>> findMerchant(Map<String, Object> ParamsMap) {
        List<Map<String,Object>> listMap = wechatMapper.findMerchant(ParamsMap);
//        添加判断menuId方便前端分类
        int menuId = 0;
        
        listMap.get(0).put("menu_id", menuId);
        
        for (int i = 0; i < listMap.size(); i++) {
            
            if (i < listMap.size() - 1) {
                
                if (listMap.get(i).get("menu_class").equals(listMap.get(i + 1).get("menu_class"))) {
            
                } else {
                    menuId++;
                }
                listMap.get(i + 1).put("menu_id", menuId);
            }
        }
        return listMap;
    }
    
//  查询宣传滚动页
    @Override
    public List<Map<String, Object>> findScrollBar() {
        return wechatMapper.findScrollBar();
    }
    
//  通过keyId查询订单信息
    @Override
    public List<Map<String, Object>> findOrderByKeyId(String keyId) {
        return wechatMapper.findOrderByKeyId(keyId);
    }

    
}
