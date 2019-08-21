package com.Beam.mapper;

import java.util.List;
import java.util.Map;

public interface loginMapper {

    //    查询用户
    List<Map<String,Object>> findUserById(String userId);

    void updateRandomCode(Map<String, Object> map);

    void saveRandomCode(Map<String, Object> map);

    Map<String, Object> queryRandomCode(String map);

}
