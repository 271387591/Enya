package com.ozstrategy.service.system;

import com.ozstrategy.model.system.Survey;
import com.ozstrategy.service.BaseManager;

/**
* Created by lihao1 on 2015-07-27.
*/
public interface SurveyManager extends BaseManager<Survey> {
    void deleteSurvey(Survey survey);
    void publishSurvey(Survey survey);
}
