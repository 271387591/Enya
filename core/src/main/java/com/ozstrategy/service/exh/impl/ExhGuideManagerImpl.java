package com.ozstrategy.service.exh.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.exh.ExhGuideDao;
import com.ozstrategy.model.exh.ExhGuide;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.exh.ExhGuideManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("exhGuideManager")
public class ExhGuideManagerImpl extends BaseManagerImpl<ExhGuide> implements ExhGuideManager {
    @Autowired
    private ExhGuideDao exhGuideDao;

    @Override
    public BaseDao<ExhGuide> baseDao() {
        return exhGuideDao;
    }
}
