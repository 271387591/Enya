package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.Answer;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-27.
*/
public class AnswerCommand {
    private Long id;
    private Long questionId;
    private String answer;
    private Date createDate;
    private Long surveyId;
    public AnswerCommand() {
    }
    public AnswerCommand(Answer model) {
        this.id=model.getId();
        this.questionId=model.getQuestionId();
        this.answer=model.getAnswer();
        this.createDate=model.getCreateDate();
        this.surveyId=model.getSurveyId();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public Long getQuestionId() {
        return questionId;
    }
    public void setQuestionId(Long questionId) {
        this.questionId = questionId;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public Date getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    public Long getSurveyId() {
        return surveyId;
    }
    public void setSurveyId(Long surveyId) {
        this.surveyId = surveyId;
    }
}
