package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.SurveyDao;
import com.ozstrategy.model.system.Survey;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-27.
*/
@Repository("surveyDao")
public class SurveyDaoImpl extends BaseDaoImpl<Survey> implements SurveyDao{

    public SurveyDaoImpl() {
    super(Survey.class);
    }

}