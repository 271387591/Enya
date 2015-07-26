package com.ozstrategy.service.exh;

import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.service.BaseManager;

import java.util.List;
import java.util.Map;

/**
* Created by lihao1 on 2015-07-13.
*/
public interface ExhibitionHallManager extends BaseManager<ExhibitionHall> {
    Map<String,Object> hallDetail(Long id);
}
