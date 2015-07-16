package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhibitionHallDao;
import com.ozstrategy.model.exh.ExhibitionHall;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhibitionHallManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhibitionHallManager")
public class ExhibitionHallManagerImpl extends BaseManagerImpl<ExhibitionHall> implements ExhibitionHallManager {
    @Autowired
    private ExhibitionHallDao exhibitionHallDao;

    @Override
    public BaseDao<ExhibitionHall> baseDao() {
        return exhibitionHallDao;
    }
}
