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
            <h5>反馈详情</h5>
        </div>

        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="friendTable">
                <tbody>
                <tr><td style="width: 100px;">联系方式:</td><td>${command.contract}</td></tr>
                <tr><td style="width: 100px;">反馈时间:</td><td><fmt:formatDate value="${command.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td></tr>
                <tr><td style="width: 100px;">用户名:</td><td>${command.username}</td></tr>
                <tr><td style="width: 100px;">用户邮箱:</td><td>${command.email}</td></tr>
                <tr><td style="width: 100px;">反馈内容:</td><td>${command.content}</td></tr>
                </tbody>
            </table>
        </div>
        <div class="table-bottom">
            <div class="clearfix form-actions clear">
                <div class="col-md-offset-3 col-md-9 btn-group">
                    <button type="button" class="btn btn-primary" onclick="removeDetail(${command.id});">
                        <span><i class="fa fa-remove"></i>删除该记录</span>
                    </button>
                    <button type="button" class="btn btn-default" onclick="re('descriptionExh','html/question/security/questionList/${command.id}');;">
                        <span><i class="fa fa-history"></i>返回</span>
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
