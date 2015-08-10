package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.UserSurvey;

import java.util.Date;

/**
* Created by lihao1 on 2015-07-27.
*/
public class UserSurveyCommand {
    private Long id;
    private Long questionId;
    private Long userId;
    private Long answerId;
    private Date createDate;
    private Long surveyId;
    private String answerContent;
    public UserSurveyCommand() {
    }
    public UserSurveyCommand(UserSurvey model) {
        this.id=model.getId();
        this.questionId=model.getQuestionId();
        this.userId=model.getUserId();
        this.answerId=model.getAnswerId();
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
    public Long getUserId() {
        return userId;
    }
    public void setUserId(Long userId) {
        this.userId = userId;
    }
    public Long getAnswerId() {
        return answerId;
    }
    public void setAnswerId(Long answerId) {
        this.answerId = answerId;
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

    public String getAnswerContent() {
        return answerContent;
    }

    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }
}
