package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.EmailConfigDao;
import com.ozstrategy.model.system.EmailConfig;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-25.
*/
@Repository("emailConfigDao")
public class EmailConfigDaoImpl extends BaseDaoImpl<EmailConfig> implements EmailConfigDao{

    public EmailConfigDaoImpl() {
    super(EmailConfig.class);
    }

}