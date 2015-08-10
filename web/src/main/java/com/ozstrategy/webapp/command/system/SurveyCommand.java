package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.Survey;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-27.
*/
public class SurveyCommand {
    private Long id;
    private Boolean enabled;
    private String name;
    private Date createDate;
    private Boolean hasUser=Boolean.FALSE;
    public SurveyCommand() {
    }
    public SurveyCommand(Survey model) {
        this.id=model.getId();
        this.enabled=model.getEnabled();
        this.name=model.getName();
        this.createDate=model.getCreateDate();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Boolean getEnabled() {
        return enabled;
    }
    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Boolean getHasUser() {
        return hasUser;
    }

    public void setHasUser(Boolean hasUser) {
        this.hasUser = hasUser;
    }
}
