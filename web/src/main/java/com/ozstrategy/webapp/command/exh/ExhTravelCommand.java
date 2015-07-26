package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhTravel;
/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhTravelCommand {
    private Long id;
    private Long exhId;
    private String travel;
    public ExhTravelCommand() {
    }
    public ExhTravelCommand(ExhTravel model) {
        this.id=model.getId();
        this.exhId=model.getExhId();
        this.travel=model.getTravel();
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
    public String getTravel() {
        return travel;
    }
    public void setTravel(String travel) {
        this.travel = travel;
    }
}
