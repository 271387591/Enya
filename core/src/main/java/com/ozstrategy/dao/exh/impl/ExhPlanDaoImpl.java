package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhPlanDao;
import com.ozstrategy.model.exh.ExhPlan;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
* Created by lihao1 on 2015-08-05.
*/
@Repository("exhPlanDao")
public class ExhPlanDaoImpl extends BaseDaoImpl<ExhPlan> implements ExhPlanDao{

    public ExhPlanDaoImpl() {
    super(ExhPlan.class);
    }

    @Override
    public List<Map<String, Object>> listYears() {
        String sql="select year from t_exhplan where publish=1 group by year";
        return jdbcTemplate.queryForList(sql);
    }
}