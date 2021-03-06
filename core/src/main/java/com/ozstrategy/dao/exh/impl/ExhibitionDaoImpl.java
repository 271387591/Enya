package com.ozstrategy.dao.exh.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.exh.ExhibitionDao;
import com.ozstrategy.model.dictionary.Dictionary;
import com.ozstrategy.model.exh.Exhibition;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


/**
* Created by lihao1 on 2015-07-13.
*/
@Repository("exhibitionDao")
public class ExhibitionDaoImpl extends BaseDaoImpl<Exhibition> implements ExhibitionDao{

    public ExhibitionDaoImpl() {
    super(Exhibition.class);
    }


}