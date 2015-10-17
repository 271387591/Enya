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

    private String exhIds;
    private String exhNames;

    private String tradeIds;
    private String tradeNames;

    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;
    private Integer index;
    private String imgUrl;

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
        this.exhIds= model.getExhIds();
        this.exhNames= model.getExhNames();
        this.tradeIds= model.getTradeIds();
        this.tradeNames= model.getTradeNames();
        this.pubDate= model.getPubDate();
        this.publish= model.getPublish();
        this.idx= model.getIdx();
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

    public String getExhIds() {
        return exhIds;
    }

    public void setExhIds(String exhIds) {
        this.exhIds = exhIds;
    }

    public String getExhNames() {
        return exhNames;
    }

    public void setExhNames(String exhNames) {
        this.exhNames = exhNames;
    }

    public String getTradeIds() {
        return tradeIds;
    }

    public void setTradeIds(String tradeIds) {
        this.tradeIds = tradeIds;
    }

    public String getTradeNames() {
        return tradeNames;
    }

    public void setTradeNames(String tradeNames) {
        this.tradeNames = tradeNames;
    }

    public Boolean getPublish() {
        return publish;
    }

    public void setPublish(Boolean publish) {
        this.publish = publish;
    }

    public Integer getIdx() {
        return idx;
    }

    public void setIdx(Integer idx) {
        this.idx = idx;
    }

    public Date getPubDate() {
        return pubDate;
    }

    public void setPubDate(Date pubDate) {
        this.pubDate = pubDate;
    }

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
