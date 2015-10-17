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
    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;
    private Integer index;
    private String imgUrl;
    public ExhServiceCommand() {
    }
    public ExhServiceCommand(ExhService model) {
        this.content=model.getContent();
        this.id=model.getId();
        this.title=model.getTitle();
        this.source=model.getSource();
        this.createDate=model.getCreateDate();
        this.publish= model.getPublish();
        this.pubDate= model.getPubDate();
        this.idx= model.getIdx();
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
