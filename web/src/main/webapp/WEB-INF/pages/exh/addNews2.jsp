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
    <title>${command.id==null?'添加新闻':'编辑新闻'}</title>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.config.js"/>"></script>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.all.min.js"/>"></script>

</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/exhNews/security/index');">新闻管理</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加新闻':'编辑新闻'}</li>
        </ul>
        <div class="right-content">
            <form class="form-horizontal padding-10" id="addNewsForm">
                <input type="hidden" name="id" value="${command.id}">
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">新闻标题</label>
                    <div class="col-sm-5 no-padding-right">
                        <input type="text" name="title" class="form-control" data-validate="required" placeholder="新闻标题" value="${command.title}">
                    </div>
                    <i class="notnull">*</i>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">关键字</label>
                    <div class="col-sm-5 no-padding-right">
                        <select id="newsKeywordSelector" multiple="" class="form-control chosen-select" name="keywordIds">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">行业</label>
                    <div class="col-sm-5 no-padding-right">
                        <select id="newsTradesSelector" multiple="" class="form-control chosen-select" name="tradeIds">
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label no-padding-right">涉及展会</label>
                    <div class="col-sm-5 no-padding-right">
                        <select id="newsExhSelector" multiple="" class="form-control chosen-select" name="exhIds">
                        </select>
                    </div>
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
                        <button type="button" class="btn btn-primary" onclick="save();">
                            <span><i class="fa fa-save"></i>保存</span>
                        </button>
                        <button type="button" class="btn btn-default" onclick="reloadPage('html/exhNews/security/index');">
                            <span><i class="fa fa-history"></i>返回</span>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/exhNews.js"/>"></script>
<script type="text/javascript">
    initComboData($("#newsKeywordSelector"),'html/dictionary/security/list',{start:0,limit:20000,Q_type_EQ:0},'id','keyValue','${command.keywordIds}'.split(','));
    initComboData($("#newsTradesSelector"),'html/dictionary/security/list',{start:0,limit:20000,Q_type_EQ:4},'id','keyValue','${command.tradeIds}'.split(","));
    initComboData($("#newsExhSelector"),'html/exhibition/list',{start:0,limit:20000},'id','name','${command.exhIds}'.split(","));
    if(addNewsEditors){
        addNewsEditors.destroy();
    }
    var addNewsEditors = UE.getEditor('addNewsEditor');
    addNewsEditors.ready(function() {
        var div=$('<div></div>').append('${command.news}');
        var des = div.find('img').each(function(){
            var src=$(this).attr('src') || '';
            var index=src.indexOf("updload/ue");
            if(index!=-1){
                src='${command.imgUrl}'+src.substr(index);
                $(this).attr("src",src);
            }
        });
        addNewsEditors.setContent(div.html());
        $('#newsKeywordSelector,#newsTradesSelector,#newsExhSelector').chosen({
            placeholder_text:'请选择'
        });
    });
</script>
</body>
</html>


