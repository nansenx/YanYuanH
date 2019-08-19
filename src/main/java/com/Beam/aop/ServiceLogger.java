package com.Beam.aop;

import org.aspectj.lang.JoinPoint;

import java.util.Arrays;
import org.apache.log4j.Logger;

public class ServiceLogger {
    private static final Logger log = Logger.getLogger(ServiceLogger.class);

    public void before(JoinPoint jp) {
        log.info(" 调用 " + jp.getTarget() + " 的 " + jp.getSignature().getName()
                + " 方法，方法入参： " + Arrays.toString(jp.getArgs()));
    }

    public void afterReturning(JoinPoint jp, Object result) {
        log.info(" 调用 " + jp.getTarget() + " 的 " + jp.getSignature().getName()
                + " 方法，方法返回值： " + result);
    }
}
