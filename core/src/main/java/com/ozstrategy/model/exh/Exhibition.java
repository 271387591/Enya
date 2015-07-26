package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.NamedQueries;
import com.ozstrategy.annotations.NamedQuery;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

import java.util.Date;

/**
 * Created by lihao1 on 7/13/15.
 */
@Table(name = "t_exhibition")
@NamedQueries({
        @NamedQuery(name = "getExh",query = "select exh.*,h.name as hallName,h.address,h.lng,h.lat,t1.commentCount from t_exhibition exh join t_exhibitionhall h on exh.hallId=h.id left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=0 GROUP BY c.itemId )t1 on exh.id=t1.itemId  where exh.id=:id "),
        @NamedQuery(name = "getExhs",query = "select exh.*,h.name as hallName,h.address,h.lng,h.lat,t1.commentCount from t_exhibition exh join t_exhibitionhall h on exh.hallId=h.id left join (select count(c.id) as commentCount,c.itemId from t_comment c where c.typeId=0 GROUP BY c.itemId )t1 on exh.id=t1.itemId where 1=1 "),
        @NamedQuery(name = "getExhsCount",query = "select count(*) from t_exhibition exh join t_exhibitionhall h on exh.hallId=h.id where 1=1 ")
})
public class Exhibition extends BaseEntity {
    private Long id;
    private Long hallId;
    private String name;
    private Date startDate;
    private Date endDate;
    private Date createDate;
    private String picName;
    private String picPath;
    private String picUrl;
    private String logoName;
    private String logoPath;
    private String logoUrl;
    private Boolean hot=Boolean.FALSE;
    private String tradeIds;
    private String tradeNames;
    private String keywordIds;
    private String keywordNames;
    private Integer previewCount=0;
    private Integer shareCount=0;



    public Exhibition() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getHallId() {
        return hallId;
    }

    public void setHallId(Long hallId) {
        this.hallId = hallId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getPicName() {
        return picName;
    }

    public void setPicName(String picName) {
        this.picName = picName;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public Boolean getHot() {
        return hot;
    }

    public void setHot(Boolean hot) {
        this.hot = hot;
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

    public String getLogoName() {
        return logoName;
    }

    public void setLogoName(String logoName) {
        this.logoName = logoName;
    }

    public String getLogoPath() {
        return logoPath;
    }

    public void setLogoPath(String logoPath) {
        this.logoPath = logoPath;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        Exhibition user = (Exhibition) o;
        return new EqualsBuilder()
                .append(id, user.id)
                .isEquals();
    }

    @Override
    public int hashCode() {
        return new HashCodeBuilder()
                .append(id)
                .hashCode();

    }
}
