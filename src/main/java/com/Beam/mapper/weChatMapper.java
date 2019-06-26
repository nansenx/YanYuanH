package com.Beam.mapper;

import java.util.List;
import java.util.Map;

public interface weChatMapper {

//    添加用户信息
    boolean insertCustomer(Map<String, Object> ParamsMap);

    //    查询商家外卖
    List<Map<String,Object>> findMenu();
    //添加订单信息

    boolean insertOrder(Map<String, Object> ParamsMap);
//    查询商家详情页

    List<Map<String,Object>> findMerchant(Map<String, Object> ParamsMap);

//    查询滚动页
    List<Map<String,Object>> findScrollBar();
}
