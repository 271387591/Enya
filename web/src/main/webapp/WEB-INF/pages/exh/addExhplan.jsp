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
    <title>${command.id==null?'添加计划':'编辑计划'}</title>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.config.js"/>"></script>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.all.min.js"/>"></script>

</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/exhPlan/security/index');">会展计划管理</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加计划':'编辑计划'}</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>${command.id==null?'添加计划':'编辑计划'}</h5></li>
                </ul>
                <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="reloadPage('html/exhPlan/security/index');">
                    <span><i class="fa fa-mail-reply"></i>返回列表</span>
                </button>
            </div>
            <div class="content-box">
                <form class="form-horizontal padding-10" id="userForm">
                    <input name="id" value="${command.id}" type="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">展会名称</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="title" data-validate="required" value="${command.title}" placeholder="标题"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">举办年份</label>
                        <div class="col-sm-5 no-padding-right">
                            <select class="form-control" name="year">
                                <option value="2010">2010年</option>
                                <option value="2011">2011年</option>
                                <option value="2012">2012年</option>
                                <option value="2013">2013年</option>
                                <option value="2014">2014年</option>
                                <option value="2015">2015年</option>
                                <option value="2016">2016年</option>
                                <option value="2017">2017年</option>
                                <option value="2018">2018年</option>
                                <option value="2019">2019年</option>
                                <option value="2020">2020年</option>
                            </select>
                        </div>
                        <i class="notnull">*</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">举办时间</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="holdDate" data-validate="required" value="${command.holdDate}" placeholder="举办时间"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">举办地点</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="address" data-validate="required" value="${command.address}" placeholder="举办地点"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">外部链接</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="outUrl" data-validate="url"  value="${command.outUrl}" placeholder="外部链接"  />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label">计划内容</label>
                        <div class="col-sm-11">
                            <script type="text/plain" id="desEditor" style="width:1000px;height:240px;">
                            <p></p>
                        </script>
                        </div>
                    </div>

                    <div class="clearfix form-actions clear">
                        <div class="col-md-offset-3 col-md-9 btn-group">
                            <button type="button" class="btn btn-primary" onclick="saveNews(${command.id!=null?"'edit'":"'save'"});">
                                <span><i class="fa fa-save"></i>保存</span>
                            </button>
                            <button type="button" class="btn btn-default" onclick="reloadPage('html/exhPlan/security/index');">
                                <span><i class="fa fa-history"></i>返回</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/exhplan.js"/>"></script>
<script type="text/javascript">
    $(function(){
        var desEditor = UE.getEditor('desEditor');
        if(${command.id!=null}){
            desEditor.ready(function() {
                var div=$('<div></div>').append('${command.content}');
                var des = div.find('img').each(function(){
                    var src=$(this).attr('src') || '';
                    var index=src.indexOf("updload/ue");
                    if(index!=-1){
                        src='${command.imgUrl}'+src.substr(index);
                        $(this).attr("src",src);
                    }
                });
                desEditor.setContent(div.html());
            });
            $('select[name=year]').val('${command.year}')
        }else{
            $('select[name=year]').val(new Date().getFullYear());
        }
    });
</script>
</body>
</html>


