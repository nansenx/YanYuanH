package com.Beam.mapper;

import com.sun.javafx.collections.MappingChange;

import java.util.List;
import java.util.Map;

public interface weChatMapper {
    String findData(Map<String,Object> ParamsMap);

//    添加用户信息
    boolean insertCustomer(Map<String, Object> ParamsMap);

    //    查询商家外卖
    Map<String, Object> findMenu();
}
