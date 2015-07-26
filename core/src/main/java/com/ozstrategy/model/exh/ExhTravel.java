package com.ozstrategy.model.exh;

import com.ozstrategy.annotations.Id;
import com.ozstrategy.annotations.Table;
import com.ozstrategy.model.BaseEntity;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Created by lihao1 on 7/16/15.
 */
@Table(name = "t_exhtravel")
public class ExhTravel extends BaseEntity{
    @Id
    private Long id;
    private Long exhId;
    private String travel;

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

    public String getTravel() {
        return travel;
    }

    public void setTravel(String travel) {
        this.travel = travel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        ExhTravel role = (ExhTravel) o;
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
