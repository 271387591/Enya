package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.system.AnswerDao;
import com.ozstrategy.dao.system.QuestionDao;
import com.ozstrategy.dao.system.SurveyDao;
import com.ozstrategy.dao.system.UserSurveyDao;
import com.ozstrategy.model.system.Answer;
import com.ozstrategy.model.system.Question;
import com.ozstrategy.model.system.Survey;
import com.ozstrategy.model.system.UserSurvey;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.SurveyManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("surveyManager")
public class SurveyManagerImpl extends BaseManagerImpl<Survey> implements SurveyManager {
    @Autowired
    private SurveyDao surveyDao;
    @Autowired
    private AnswerDao answerDao;
    @Autowired
    private QuestionDao questionDao;
    @Autowired
    private UserSurveyDao userSurveyDao;




    @Override
    public BaseDao<Survey> baseDao() {
        return surveyDao;
    }

    @Override
    public void deleteSurvey(Survey survey) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_surveyId_EQ",survey.getId());
        userSurveyDao.deleteByParam(map);
        answerDao.deleteByParam(map);
        questionDao.deleteByParam(map);
        surveyDao.delete(survey);
    }

    @Override
    public void publishSurvey(Survey survey) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_enabled_EQ",true);
        Survey ps=surveyDao.getByParam(map);
        if(ps!=null){
            ps.setEnabled(false);
            surveyDao.update(ps);
        }
        survey.setEnabled(true);
        surveyDao.update(survey);
    }
}
