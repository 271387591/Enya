package com.ozstrategy.dao.exh;
import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.model.exh.ExhPlan;

import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-08-05.
*/
public interface ExhPlanDao extends BaseDao<ExhPlan> {
    List<Map<String,Object>> listYears();
}