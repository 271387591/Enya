package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhPlan;

import java.util.Date;

/**
* Created by lihao1 on 2015-08-05.
*/
public class ExhPlanCommand {
    private String content;
    private Long id;
    private String title;
    private Date createDate;
    private String address;
    private String holdDate;
    private String outUrl;
    public ExhPlanCommand() {
    }
    public ExhPlanCommand(ExhPlan model) {
        this.content=model.getContent();
        this.id=model.getId();
        this.title=model.getTitle();
        this.createDate=model.getCreateDate();
        this.holdDate=model.getHoldDate();
        this.outUrl=model.getOutUrl();
        this.address=model.getAddress();
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHoldDate() {
        return holdDate;
    }

    public void setHoldDate(String holdDate) {
        this.holdDate = holdDate;
    }

    public String getOutUrl() {
        return outUrl;
    }

    public void setOutUrl(String outUrl) {
        this.outUrl = outUrl;
    }
}
