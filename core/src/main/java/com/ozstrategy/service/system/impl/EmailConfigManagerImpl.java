package com.ozstrategy.service.system.impl;

import com.ozstrategy.dao.BaseDao;
import com.ozstrategy.dao.system.EmailConfigDao;
import com.ozstrategy.model.system.EmailConfig;
import com.ozstrategy.service.impl.BaseManagerImpl;
import com.ozstrategy.service.system.EmailConfigManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* Created by lihao1 on 6/8/15.
*/
@Service("emailConfigManager")
public class EmailConfigManagerImpl extends BaseManagerImpl<EmailConfig> implements EmailConfigManager {
    @Autowired
    private EmailConfigDao emailConfigDao;

    @Override
    public BaseDao<EmailConfig> baseDao() {
        return emailConfigDao;
    }
}
