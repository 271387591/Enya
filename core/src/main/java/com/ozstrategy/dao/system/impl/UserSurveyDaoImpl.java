package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.UserSurveyDao;
import com.ozstrategy.model.system.UserSurvey;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-27.
*/
@Repository("userSurveyDao")
public class UserSurveyDaoImpl extends BaseDaoImpl<UserSurvey> implements UserSurveyDao{

    public UserSurveyDaoImpl() {
    super(UserSurvey.class);
    }

}