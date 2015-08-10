package com.ozstrategy.webapp.command.system;
import com.ozstrategy.model.system.Question;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
* Created by lihao1 on 2015-07-27.
*/
public class QuestionCommand {
    private Long id;
    private String question;
    private Date createDate;
    private Long surveyId;
    private Integer type;
    private List<AnswerCommand> answers=new ArrayList<AnswerCommand>();
    public QuestionCommand() {
    }
    public QuestionCommand(Question model) {
        this.id=model.getId();
        this.question=model.getQuestion();
        this.createDate=model.getCreateDate();
        this.surveyId=model.getSurveyId();
        this.type=model.getType();
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
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

    public List<AnswerCommand> getAnswers() {
        return answers;
    }

    public void setAnswers(List<AnswerCommand> answers) {
        this.answers = answers;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
