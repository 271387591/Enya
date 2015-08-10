package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.system.AnswerDao;
import com.ozstrategy.model.system.Answer;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.AnswerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("answerManager")
public class AnswerManagerImpl extends BaseManagerImpl<Answer> implements AnswerManager {
    @Autowired
    private AnswerDao answerDao;

    @Override
    public BaseDao<Answer> baseDao() {
        return answerDao;
    }
}
