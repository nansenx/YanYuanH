package com.Beam.biz.impl;

import com.Beam.biz.weChatService;
import com.Beam.mapper.weChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.ArrayList;
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
        wechatMapper.insertCustomer(ParamsMap);
        return true;
    }

//    查询商家外卖
    @Override
    public Map<String, Object> findMenu() {
        Map<String,Object> map = wechatMapper.findMenu();
        map.put("region_1_images",pulsLink(map,"region_1_images"));
        map.put("region_2_images",pulsLink(map,"region_2_images"));
        return map;
    }

//    添加订单信息
    @Override
    public Boolean insertOrder(Map<String, Object> ParamsMap) {
        wechatMapper.insertOrder(ParamsMap);
        return null;
    }

    /**
    为数据库图片加上
     “http://192.168.199.161:8080/images/BuDaiMo/region_1/”字段
     的方法
    **/
    List<String> pulsLink(Map<String, Object> map, String ziDuan){
        String string = (String) map.get(ziDuan);
        String [] strings = string.split("，");
        List<String> list = new ArrayList<>();
        for (int i = 0; i < strings.length; i++) {
            String str = strings[i];
            string = "http://192.168.199.161:8080/images/BuDaiMo/region_1/"+str;
            list.add(string);
        }
        return list;
    }

}
