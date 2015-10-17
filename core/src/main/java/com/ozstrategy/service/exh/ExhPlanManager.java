package com.ozstrategy.service.exh;

import com.ozstrategy.model.exh.ExhPlan;
import com.ozstrategy.service.BaseManager;

import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-08-05.
*/
public interface ExhPlanManager extends BaseManager<ExhPlan> {
    List<Map<String,Object>> listYears();
    void publish(ExhPlan exhPlan);
}
