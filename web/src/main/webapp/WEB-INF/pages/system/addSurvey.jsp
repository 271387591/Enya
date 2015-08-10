<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>${command.id==null?'添加问卷':'编辑问卷'}</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/survey/security/index');">在线调查</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加问卷':'编辑问卷'}</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>${command.id==null?'添加问卷':'编辑问卷'}</h5></li>
                </ul>
                <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="reloadPage('html/survey/security/index');">
                    <span><i class="fa fa-mail-reply"></i>返回列表</span>
                </button>
            </div>
            <div class="content-box">
                <div class="table-title">
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="basicInfo" role="presentation" class="active"><a href="#basicInfoExh" aria-controls="home" role="tab" data-toggle="tab">问卷名称</a></li>
                        <li id="tab-description" ${command.id==null?'class="disabled"':''}  aria-disabled="true" role="presentation"><a href="#descriptionExh" role="tab" data-toggle="tab">问卷题目</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="basicInfoExh">
                        <form class="form-horizontal padding-10" id="exhibitionForm">
                            <input type="hidden" value="${command.id}" name="id"/>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">问卷名称</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" name="name" class="form-control" data-validate="required" placeholder="问卷名称" value="${command.name}">
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-6 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/survey/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="descriptionExh">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/admin/system/survey.js"/>"></script>
<script type="text/javascript">
    changeMenu($('#menu-survey'));
    $('#tab-description a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        ajaxReloadPage('descriptionExh','html/question/security/questionList/${command.id}');
    });
    $(function(){

    });
</script>
</body>
</html>


