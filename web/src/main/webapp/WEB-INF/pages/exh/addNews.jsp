<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/19/15
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="right-content">
    <form class="form-horizontal padding-10" id="addNewsForm">
        <input type="hidden" name="id" value="${command.id}">
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right">资讯标题</label>
            <div class="col-sm-5 no-padding-right">
                <input type="text" name="title" class="form-control" data-validate="required" placeholder="资讯标题" value="${command.title}">
            </div>
            <i class="notnull">*</i>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label no-padding-right">资讯关键字</label>
            <div class="col-sm-5 no-padding-right">
                <select id="newsKeywordSelector" multiple="" class="form-control chosen-select" name="keywordIds" data-validate="required">
                </select>
            </div>
            <i class="notnull">*</i>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label">资讯内容</label>
            <div class="col-sm-11">
                <script type="text/plain" id="addNewsEditor" style="width:1000px;height:240px;">
                    <p></p>
                </script>
            </div>
        </div>
        <div class="clearfix form-actions clear">
            <div class="col-md-offset-3 col-md-9 btn-group">
                <button type="button" class="btn btn-primary" onclick="saveNews('${command.exhId}');">
                    <span><i class="fa fa-save"></i>保存</span>
                </button>
                <button type="button" class="btn btn-default" onclick="ajaxReloadPage('newsExh','html/exhNews/security/newsList/'+${command.exhId});">
                    <span><i class="fa fa-history"></i>返回</span>
                </button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
    initComboData($("#newsKeywordSelector"),'html/dictionary/security/list',{start:0,limit:20000,Q_type_EQ:0},'id','keyValue','${command.keywordIds}'.split(','));
    if(addNewsEditors){
        addNewsEditors.destroy();
    }
    var addNewsEditors = UM.getEditor('addNewsEditor');
    addNewsEditors.ready(function() {
        addNewsEditors.setContent('${command.news}');
        $('#newsKeywordSelector').chosen({
            placeholder_text:'请选择'
        });
    });
</script>


