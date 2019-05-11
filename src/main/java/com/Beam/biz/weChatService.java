package com.Beam.biz;

import java.util.List;
import java.util.Map;

    public interface weChatService {
//        添加用户信息
        Boolean insertCustomer(Map<String, Object> ParamsMap);

        //    查询商家外卖
        Map<String, Object> findMenu();

}
