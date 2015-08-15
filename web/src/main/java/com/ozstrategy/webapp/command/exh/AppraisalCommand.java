package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.Appraisal;

import java.util.Date;

/**
* Created by lihao1 on 2015-08-13.
*/
public class AppraisalCommand {
    private String content;
    private Long id;
    private String title;
    private Date createDate;
    public AppraisalCommand() {
    }
    public AppraisalCommand(Appraisal model) {
        this.content=model.getContent();
        this.id=model.getId();
        this.title=model.getTitle();
        this.createDate=model.getCreateDate();
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
}
