package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhService;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-27.
*/
public class ExhServiceCommand {
    private String content;
    private Long id;
    private String title;
    private String source;
    private Date createDate;
    public ExhServiceCommand() {
    }
    public ExhServiceCommand(ExhService model) {
        this.content=model.getContent();
        this.id=model.getId();
        this.title=model.getTitle();
        this.source=model.getSource();
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
    public String getSource() {
        return source;
    }
    public void setSource(String source) {
        this.source = source;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
