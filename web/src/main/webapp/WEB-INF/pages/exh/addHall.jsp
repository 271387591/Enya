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
    <title>${command.id==null?'添加展馆':'编辑展馆'}</title>
    <%--<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />--%>
    <%--<link rel="stylesheet" href="<c:url value="/resources/lib/umeditor/themes/default/css/umeditor.min.css"/>" />--%>
    <%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vGDcVVUlGcuankr8TgcYWsum"></script>--%>
    <%--<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>--%>
    <script src="<c:url value="/resources/lib/map/maplink.js"/>"></script>
    <script src="<c:url value="/resources/lib/map/maplib.js"/>"></script>
    <%--<script src="<c:url value="/resources/lib/umeditor/umeditor.config.js"/>"></script>--%>
    <%--<script src="<c:url value="/resources/lib/umeditor/umeditor.min.js"/>"></script>--%>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.config.js"/>"></script>
    <script src="<c:url value="/resources/lib/ueditor/ueditor.all.min.js"/>"></script>

</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li><a href="javascript:void(0);" onclick="reloadPage('html/exhibitionHall/security/index');">展馆管理</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加展馆':'编辑展馆'}</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>${command.id==null?'添加展馆':'编辑展馆'}</h5></li>
                </ul>
                <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="reloadPage('html/exhibitionHall/security/index');">
                    <span><i class="fa fa-mail-reply"></i>返回列表</span>
                </button>
            </div>
            <div class="content-box">
                <form class="form-horizontal padding-10" id="userForm" enctype="multipart/form-data" method="post">
                    <input name="id" value="${command.id}" type="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-1 control-label no-padding-right">展馆名称</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="name" data-validate="required" value="${command.name}" placeholder="展馆名称"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">地址</label>
                        <div class="col-sm-5 no-padding-right">
                            <input type="text" class="form-control" name="address" data-validate="required" value="${command.address}" placeholder="地址"  />
                        </div>
                        <i class="notnull">*</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">展馆一级logo</label>
                        <div class="col-sm-5 no-padding-right">
                            <input value="${command.logo1Name}" name="logo1Name" type='text' readonly id="logotextfield" data-validate="picture" class='form-control' onclick="uploadClick($(this),$('#uplogoInput'))" />
                        </div>
                        <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#logotextfield'),$('#uplogoInput'))" >
                            选择图片
                        </button>

                        <input type="file" style="display:none;" id="uplogoInput" name="logo1"  />
                        <i class="notnull">*</i>
                        <i class="notnull green">建议上传高度约200，宽度约310的图片</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">展馆二级logo</label>
                        <div class="col-sm-5 no-padding-right">
                            <input value="${command.logo2Name}" name="logo2Name" type='text' readonly id="xctextfield" data-validate="picture" class='form-control' onclick="uploadClick($(this),$('#upxcInput'))" />
                        </div>
                        <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#xctextfield'),$('#upxcInput'))" >
                            选择图片
                        </button>
                        <input type="file" style="display:none;" id="upxcInput" name="logo2"  />
                        <i class="notnull">*</i>
                        <i class="notnull green">建议上传高度约500，宽度约1000的图片</i>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-1 control-label">展馆介绍</label>
                        <div class="col-sm-11">
                            <script type="text/plain" id="desEditor" style="width:1000px;height:240px;">
                            <p></p>
                        </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <input type="hidden" name="lng" value="${command.lng}">
                        <input type="hidden" name="lat" value="${command.lat}">
                        <label class="col-sm-1 control-label">展馆位置</label>
                        <div class="col-sm-11">
                            <div class="table-title green" style="padding-left: 10px;width:1000px;">鼠标左键点击定位</div>
                            <div id="baiduMap" style="width:1000px;height:500px;border:1px solid gray"></div>
                        </div>
                    </div>
                    <div class="clearfix form-actions clear">
                        <div class="col-md-offset-3 col-md-9 btn-group">
                            <button id="subBtn" type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                                <span><i class="fa fa-save"></i>保存</span>
                            </button>
                            <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibitionHall/security/index');">
                                <span><i class="fa fa-history"></i>返回</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/hall.js"/>"></script>
<script type="text/javascript">
    $(function(){
        initAdd(${command.id==null},'${command.lng}','${command.lat}');
//        var desEditor = UM.getEditor('desEditor');
        var desEditor = UE.getEditor('desEditor');
        if(${command.id!=null}){
            desEditor.ready(function() {
                var div=$('<div></div>').append('${command.description}');
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
        }
    });
</script>
</body>
</html>


