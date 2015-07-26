package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhGuideToDao;
import com.ozstrategy.model.exh.ExhGuideTo;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhGuideToDao")
public class ExhGuideToDaoImpl extends BaseDaoImpl<ExhGuideTo> implements ExhGuideToDao{

    public ExhGuideToDaoImpl() {
    super(ExhGuideTo.class);
    }

}