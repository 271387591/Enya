package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhGuideDao;
import com.ozstrategy.model.exh.ExhGuide;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-16.
*/
@Repository("exhGuideDao")
public class ExhGuideDaoImpl extends BaseDaoImpl<ExhGuide> implements ExhGuideDao{

    public ExhGuideDaoImpl() {
    super(ExhGuide.class);
    }

}