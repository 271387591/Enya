package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.AnswerDao;
import com.ozstrategy.model.system.Answer;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-27.
*/
@Repository("answerDao")
public class AnswerDaoImpl extends BaseDaoImpl<Answer> implements AnswerDao{

    public AnswerDaoImpl() {
    super(Answer.class);
    }

}