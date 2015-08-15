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
    <title>${command.id==null?'添加报告':'编辑报告'}</title>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.config.js"/>"></script>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.all.min.js"/>"></script>

</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/appraisal/security/index');">评估报告</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加报告':'编辑报告'}</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>${command.id==null?'添加报告':'编辑报告'}</h5></li>
                </ul>
                <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="reloadPage('html/appraisal/security/index');">
                    <span><i class="fa fa-mail-reply"></i>返回列表</span>
                </button>
            </div>
            <div class="content-box">
                <form class="form-horizontal padding-10" id="userForm">
                    <input name="id" value="${command.id}" type="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">标题</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="title" data-validate="required" value="${command.title}" placeholder="标题"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">报告内容</label>
                        <div class="col-sm-11">
                            <script type="text/plain" id="desEditor" style="width:1000px;height:240px;">
                            <p></p>
                        </script>
                        </div>
                    </div>

                    <div class="clearfix form-actions clear">
                        <div class="col-md-offset-3 col-md-9 btn-group">
                            <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                                <span><i class="fa fa-save"></i>保存</span>
                            </button>
                            <button type="button" class="btn btn-default" onclick="reloadPage('html/appraisal/security/index');">
                                <span><i class="fa fa-history"></i>返回</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/appraisal.js"/>"></script>
<script type="text/javascript">
    $(function(){
        var desEditor = UE.getEditor('desEditor');
        if(${command.id!=null}){
            desEditor.ready(function() {
                desEditor.setContent('${command.content}');
            });
        }
    });
</script>
</body>
</html>


