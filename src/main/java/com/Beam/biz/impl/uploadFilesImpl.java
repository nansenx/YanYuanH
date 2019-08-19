package com.Beam.biz.impl;

import com.Beam.biz.uploadFilesService;
import com.Beam.mapper.uploadFilesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.Map;

@Service
@Transactional
public class uploadFilesImpl implements uploadFilesService {

    @Autowired
    private uploadFilesMapper uploadFilesMapper;

//    添加用户信息
    @Override
    public Boolean insertImages(Map<String, Object> ParamsMap) {

        return uploadFilesMapper.insertImages(ParamsMap);
    }


}
