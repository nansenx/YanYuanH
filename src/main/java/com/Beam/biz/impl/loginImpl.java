package com.Beam.biz.impl;

import com.Beam.biz.loginService;
import com.Beam.biz.weChatService;
import com.Beam.mapper.loginMapper;
import com.Beam.mapper.weChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class loginImpl implements loginService {

    @Autowired
    private loginMapper loginMapper;


    @Override
    public List<Map<String, Object>> findUserById(String userId) {
        return loginMapper.findUserById(userId);
    }

    @Override
    public void updateRandomCode(Map<String, Object> map) {
        loginMapper.updateRandomCode(map);
    }

    @Override
    public void saveRandomCode(Map<String, Object> map) {
        loginMapper.saveRandomCode(map);

    }

    @Override
    public Map<String, Object> queryRandomCode(String map) {
        return loginMapper.queryRandomCode(map);
    }
}
