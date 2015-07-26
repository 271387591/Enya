package com.ozstrategy.dao.system.impl;

import com.ozstrategy.dao.impl.BaseDaoImpl;
import com.ozstrategy.dao.system.FriendLinkDao;
import com.ozstrategy.model.system.FriendLink;
import org.springframework.stereotype.Repository;


/**
* Created by lihao1 on 2015-07-20.
*/
@Repository("friendLinkDao")
public class FriendLinkDaoImpl extends BaseDaoImpl<FriendLink> implements FriendLinkDao{

    public FriendLinkDaoImpl() {
    super(FriendLink.class);
    }

}