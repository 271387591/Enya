package com.ozstrategy.webapp.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@RestController
public class SimpleMVController implements InitializingBean {

    private final transient Log log = LogFactory.getLog(this.getClass());

    public void afterPropertiesSet() throws Exception {
    }

    @RequestMapping("/security/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("admin/login");
    }
    @RequestMapping("/security/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("admin/logout");
    }
    @RequestMapping("/web/home")
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("web/index");
    }
    @RequestMapping("/web/baidu")
    public ModelAndView baidu(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("web/baidu");
    }




}
