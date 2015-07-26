package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhGuideToDao;
import com.ozstrategy.model.exh.ExhGuideTo;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhGuideToManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhGuideToManager")
public class ExhGuideToManagerImpl extends BaseManagerImpl<ExhGuideTo> implements ExhGuideToManager {
    @Autowired
    private ExhGuideToDao exhGuideToDao;

    @Override
    public BaseDao<ExhGuideTo> baseDao() {
        return exhGuideToDao;
    }
}
