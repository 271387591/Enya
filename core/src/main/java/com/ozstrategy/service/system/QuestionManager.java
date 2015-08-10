package com.ozstrategy.service.system;

import com.ozstrategy.model.system.Answer;
import com.ozstrategy.model.system.Question;
import com.ozstrategy.service.BaseManager;

import java.util.Set;

/**
* Created by lihao1 on 2015-07-27.
*/
public interface QuestionManager extends BaseManager<Question> {
    void saveQuestion(Question question,Set<Answer> answers);
    void deleteQuestion(Question question);
}
