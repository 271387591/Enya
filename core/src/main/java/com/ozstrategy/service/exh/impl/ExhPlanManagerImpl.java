package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhPlanDao;
import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhPlanManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhPlanManager")
public class ExhPlanManagerImpl extends BaseManagerImpl<ExhPlan> implements ExhPlanManager {
    @Autowired
    private ExhPlanDao exhPlanDao;

    @Override
    public BaseDao<ExhPlan> baseDao() {
        return exhPlanDao;
    }

    @Override
    public List<Map<String, Object>> listYears() {
        return exhPlanDao.listYears();
    }

    @Override
    public void publish(ExhPlan exhPlan) {


    }
}
