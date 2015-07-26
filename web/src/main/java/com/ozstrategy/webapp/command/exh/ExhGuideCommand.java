package com.ozstrategy.webapp.command.exh;
import com.ozstrategy.model.exh.ExhGuide;
/**
* Created by lihao1 on 2015-07-16.
*/
public class ExhGuideCommand {
    private String guide;
    private Long id;
    private Long exhId;
    public ExhGuideCommand() {
    }
    public ExhGuideCommand(ExhGuide model) {
        this.guide=model.getGuide();
        this.id=model.getId();
        this.exhId=model.getExhId();
    }
    public String getGuide() {
        return guide;
    }
    public void setGuide(String guide) {
        this.guide = guide;
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
}
