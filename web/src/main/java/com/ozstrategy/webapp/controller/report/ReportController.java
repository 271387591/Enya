package com.ozstrategy.webapp.controller.report;

import com.ozstrategy.webapp.command.system.QuestionCommand;
import com.ozstrategy.webapp.controller.BaseController;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lihao1 on 7/29/15.
 */
@RestController
@RequestMapping("report")
public class ReportController extends BaseController{
    @RequestMapping("web/index")
    public ModelAndView games(HttpServletRequest request, HttpServletResponse response) {
        return new ModelAndView("report/index");
    }
}
