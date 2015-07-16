package com.ozstrategy.webapp.controller.web;

import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("webclient")
public class WebClientController extends BaseController {
    @RequestMapping("about")
    public ModelAndView about(HttpServletRequest request, HttpServletResponse response) {

        return new ModelAndView("web/about");
    }

    @RequestMapping("index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("web/index");
    }

}
