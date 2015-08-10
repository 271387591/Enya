package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.system.AnswerDao;
import com.ozstrategy.dao.system.QuestionDao;
import com.ozstrategy.model.system.Answer;
import com.ozstrategy.model.system.Question;
import com.ozstrategy.model.system.QuestionType;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.QuestionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("questionManager")
public class QuestionManagerImpl extends BaseManagerImpl<Question> implements QuestionManager {
    @Autowired
    private QuestionDao questionDao;
    @Autowired
    private AnswerDao answerDao;


    @Override
    public BaseDao<Question> baseDao() {
        return questionDao;
    }

    @Override
    public void saveQuestion(Question question, Set<Answer> answers) {
        saveOrUpdate(question);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_questionId_EQ",question.getId());
        if(question.getType()== QuestionType.Text.ordinal()){
            answers.clear();
            Answer answer=new Answer();
            answer.setCreateDate(new Date());
            answer.setQuestionId(question.getId());
            answer.setSurveyId(question.getSurveyId());
            answers.add(answer);
        }
        answerDao.deleteByParam(map);
        for(Answer answer:answers){
            answer.setQuestionId(question.getId());
            answerDao.save(answer);
        }
    }

    @Override
    public void deleteQuestion(Question question) {
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("Q_questionId_EQ",question.getId());
        answerDao.deleteByParam(map);
        questionDao.delete(question);
    }
}
