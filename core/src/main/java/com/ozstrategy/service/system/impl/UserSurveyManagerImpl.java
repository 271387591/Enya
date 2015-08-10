package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.system.UserSurveyDao;
import com.ozstrategy.model.system.UserSurvey;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.UserSurveyManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("userSurveyManager")
public class UserSurveyManagerImpl extends BaseManagerImpl<UserSurvey> implements UserSurveyManager {
    @Autowired
    private UserSurveyDao userSurveyDao;

    @Override
    public BaseDao<UserSurvey> baseDao() {
        return userSurveyDao;
    }
}
