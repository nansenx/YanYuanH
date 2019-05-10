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


    @Override
    public String findData(Map<String, Object> ParamsMap) {
        String str = wechatMapper.findData(ParamsMap);
        return str;
    }
//    添加用户信息
    @Override
    public Boolean insertCustomer(Map<String, Object> ParamsMap) {
        wechatMapper.insertCustomer(ParamsMap);
        return true;
    }

//    查询商家外卖
    @Override
    public Map<String, Object> findMenu() {
        Map<String,Object> map = wechatMapper.findMenu();
        return map;
    }
}
