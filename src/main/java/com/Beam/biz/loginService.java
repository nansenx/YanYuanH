package com.Beam.biz;

import java.util.List;
import java.util.Map;

public interface loginService {

    //    查询用户信息
    List<Map<String,Object>> findUserById(String userId);

    void updateRandomCode(Map<String, Object> map);

    void saveRandomCode(Map<String, Object> map);

    Map<String, Object> queryRandomCode(String map);


}
