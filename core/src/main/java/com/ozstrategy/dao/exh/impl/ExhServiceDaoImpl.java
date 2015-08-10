package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhServiceDao;
import com.ozstrategy.model.exh.ExhService;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-27.
*/
@Repository("exhServiceDao")
public class ExhServiceDaoImpl extends BaseDaoImpl<ExhService> implements ExhServiceDao{

    public ExhServiceDaoImpl() {
    super(ExhService.class);
    }

}