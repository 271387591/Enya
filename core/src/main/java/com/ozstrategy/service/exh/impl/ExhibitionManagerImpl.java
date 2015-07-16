package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhibitionDao;
import com.ozstrategy.model.exh.Exhibition;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhibitionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhibitionManager")
public class ExhibitionManagerImpl extends BaseManagerImpl<Exhibition> implements ExhibitionManager {
    @Autowired
    private ExhibitionDao exhibitionDao;

    @Override
    public BaseDao<Exhibition> baseDao() {
        return exhibitionDao;
    }
}
