package com.Beam.mapper;

import java.util.Map;

public interface weChatMapper {

//    添加用户信息
    boolean insertCustomer(Map<String, Object> ParamsMap);

    //    查询商家外卖
    Map<String, Object> findMenu();
}
