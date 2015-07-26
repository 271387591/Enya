package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhNews;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhNewsCommand {
    private Long id;
    private String title;
    private String news;
    private Long exhId;
    private Date createDate;
    private String keywordIds;
    private String keywordNames;
    public ExhNewsCommand() {
    }
    public ExhNewsCommand(ExhNews model) {
        this.id=model.getId();
        this.title=model.getTitle();
        this.news=model.getNews();
        this.exhId=model.getExhId();
        this.createDate=model.getCreateDate();
        this.keywordIds=model.getKeywordIds();
        this.keywordNames=model.getKeywordNames();
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
    public String getNews() {
        return news;
    }
    public void setNews(String news) {
        this.news = news;
    }
    public Long getExhId() {
        return exhId;
    }
    public void setExhId(Long exhId) {
        this.exhId = exhId;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getKeywordIds() {
        return keywordIds;
    }

    public void setKeywordIds(String keywordIds) {
        this.keywordIds = keywordIds;
    }

    public String getKeywordNames() {
        return keywordNames;
    }

    public void setKeywordNames(String keywordNames) {
        this.keywordNames = keywordNames;
    }
}
