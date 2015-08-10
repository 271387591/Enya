<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="right-content">
    <div class="table-box">
        <div class="table-title">
            <h5>问卷[${survey.name}]调差结果</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="friendTable">
                <tbody>
                <tr><th style="width: 100px;">标题</th><th>条目</th><th>参与人数</th></tr>
                <tr><td style="width: 100px;">问卷标题:</td><td>${survey.name}</td><td>${survey.surveyCount}</td></tr>
                <tr><td  style="width: 100px;text-align: center;font-weight: bold;font-size: 16px" colspan="3">题目详情</td></tr>
                <c:forEach var="question" items="${survey.questions}" varStatus="q">
                    <tr><td style="width: 100px;">问卷题目${q.index+1}:</td><td colspan="2">${question.question}(${question.type==0?"<span class='green'>单选</span>":(question.type==1?"<span class='blue'>多选</span>":"<span class='red'>文本</span>")})</td></tr>
                    <c:forEach var="answer" items="${question.answers}" varStatus="an">
                        <c:if test="${an.index==0}">
                            <tr><td style="width: 100px;" rowspan="${an.count}">答案:</td><td>${answer.answer}</td><td>${answer.answerCount}</td></tr>
                        </c:if>
                        <c:if test="${an.index>0}">
                            <tr><td></td><td>${answer.answer}</td><td>${answer.answerCount}</td></tr>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div class="clearfix form-actions clear">
                <div class="col-md-offset-3 col-md-9 btn-group">
                    <button type="button" class="btn btn-default" onclick="reloadPage('html/survey/security/index');">
                        <span><i class="fa fa-history"></i>返回</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
