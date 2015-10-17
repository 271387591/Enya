package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.Id;
import com.ozstrategy.annotations.NamedQueries;
import com.ozstrategy.annotations.NamedQuery;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.Date;

/**
 * Created by lihao1 on 7/16/15.
 */
@Table(name = "t_exhnews")
@NamedQueries({
        @NamedQuery(name = "getNew",query = "select en.*,t.commentCount from t_exhnews en left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=2 GROUP BY c.itemId )t on en.id=t.itemId where en.id=:id "),
        @NamedQuery(name = "getNews",query = "select en.id,en.title,en.createDate,en.keywordIds,en.keywordNames,en.previewCount,en.shareCount,t.commentCount from t_exhnews en left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=2 GROUP BY c.itemId )t on en.id=t.itemId where 1=1 ")
})
public class ExhNews extends BaseEntity{
    @Id
    private Long id;
    private Long exhId;
    private String news;
    private String title;
    private Date createDate;
    private String keywordIds;
    private String keywordNames;
    private Integer previewCount=0;
    private Integer shareCount=0;

    private String exhIds;
    private String exhNames;

    private String tradeIds;
    private String tradeNames;

    private Boolean publish=Boolean.FALSE;
    private Integer idx=1;
    private Date pubDate;

    public ExhNews() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getExhId() {
        return exhId;
    }

    public void setExhId(Long exhId) {
        this.exhId = exhId;
    }

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
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

    public Integer getPreviewCount() {
        return previewCount;
    }

    public void setPreviewCount(Integer previewCount) {
        this.previewCount = previewCount;
    }

    public Integer getShareCount() {
        return shareCount;
    }

    public void setShareCount(Integer shareCount) {
        this.shareCount = shareCount;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ExhNews role = (ExhNews) o;
        return new EqualsBuilder()
                .append(id, role.id)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .hashCode();
    }

}
