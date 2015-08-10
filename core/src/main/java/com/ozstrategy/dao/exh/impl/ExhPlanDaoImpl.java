package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhPlanDao;
import com.ozstrategy.model.exh.ExhPlan;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-08-05.
*/
@Repository("exhPlanDao")
public class ExhPlanDaoImpl extends BaseDaoImpl<ExhPlan> implements ExhPlanDao{

    public ExhPlanDaoImpl() {
    super(ExhPlan.class);
    }

}