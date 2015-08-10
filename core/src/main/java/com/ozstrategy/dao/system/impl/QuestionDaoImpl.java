package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.QuestionDao;
import com.ozstrategy.model.system.Question;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-27.
*/
@Repository("questionDao")
public class QuestionDaoImpl extends BaseDaoImpl<Question> implements QuestionDao{

    public QuestionDaoImpl() {
    super(Question.class);
    }

}