package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhSponsor;
/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhSponsorCommand {
    private Long id;
    private Long exhId;
    private String sponsor;
    public ExhSponsorCommand() {
    }
    public ExhSponsorCommand(ExhSponsor model) {
        this.id=model.getId();
        this.exhId=model.getExhId();
        this.sponsor=model.getSponsor();
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
    public String getSponsor() {
        return sponsor;
    }
    public void setSponsor(String sponsor) {
        this.sponsor = sponsor;
    }
}
