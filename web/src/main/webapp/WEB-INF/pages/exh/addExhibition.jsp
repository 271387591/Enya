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
    <title>${command.id==null?'添加展会':'编辑展会'}</title>


    <%--<link rel="stylesheet" href="<c:url value="/resources/lib/umeditor/themes/default/css/umeditor.min.css"/>" />--%>
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
            <li><a href="javascript:void(0);" onclick="reloadPage('html/exhibition/security/index');">展会管理</a></li>
            <li class="active"><i class="icon-user"></i>${command.id==null?'添加展会':'编辑展会'}</li>
        </ul>
        <div class="right-content" id="right-content">
            <div class="content-title">
                <ul>
                    <li><h5>${command.id==null?'添加展会':'编辑展会'}</h5></li>
                </ul>
                <button class="btn btn-default pull-right btn-xs offset-t10 offset-r10" onclick="reloadPage('html/exhibition/security/index');">
                    <span><i class="fa fa-mail-reply"></i>返回列表</span>
                </button>
            </div>
            <div class="content-box">
                <div class="table-title">
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="basicInfo" role="presentation" class="active"><a href="#basicInfoExh" aria-controls="home" role="tab" data-toggle="tab">基础信息</a></li>
                        <li id="tab-description" ${command.id==null?'class="disabled"':''}  aria-disabled="true" role="presentation"><a href="#descriptionExh" role="tab" data-toggle="tab">展会介绍</a></li>
                        <li id="tab-guide" ${command.id==null?'class="disabled"':''} role="presentation"><a href="#guideExh" aria-controls="profile" role="tab" data-toggle="tab">参展指南</a></li>
                        <li id="tab-sponsor" ${command.id==null?'class="disabled"':''} role="presentation"><a href="#sponsorExh" aria-controls="profile" role="tab" data-toggle="tab">主办信息</a></li>
                        <li id="tab-guideto" ${command.id==null?'class="disabled"':''} role="presentation"><a href="#guidetoExh" aria-controls="profile" role="tab" data-toggle="tab">出行指南</a></li>
                        <li id="tab-travel" ${command.id==null?'class="disabled"':''} role="presentation"><a href="#travelExh" aria-controls="profile" role="tab" data-toggle="tab">观展攻略</a></li>
                        <li id="tab-news" class="hidden" role="presentation"><a href="#newsExh" aria-controls="profile" role="tab" data-toggle="tab">展会资讯</a></li>
                    </ul>
                </div>
                <div class="clear"></div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="basicInfoExh">
                        <form class="form-horizontal padding-10" id="exhibitionForm" enctype="multipart/form-data" method="post">
                            <input type="hidden" value="${command.id}" name="id"/>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">展会名称</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input type="text" name="name" class="form-control" data-validate="required" placeholder="展会名称" value="${command.name}">
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">开始时间</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input class="form-control" value="<fmt:formatDate value="${command.startDate}" pattern="yyyy-MM-dd"/>" name="startDate" id="startDate" type="text" data-validate="required"  readonly onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'endDate\')}',dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"/>
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">结束时间</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input class="form-control" id="endDate" value="<fmt:formatDate value="${command.endDate}" pattern="yyyy-MM-dd"/>" name="endDate" type="text" data-validate="required" readonly onfocus="WdatePicker({minDate:'#F{$dp.$D(\'startDate\')}',dateFmt:'yyyy-MM-dd',lang:'zh-cn'})"/>
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">展会一级logo</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input value="${command.logoName}" name="logoName" type='text' readonly id="exhlogotextfield" data-validate="picture" class='form-control' onclick="uploadClick($(this),$('#upexhlogoInput'))" />
                                </div>
                                <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#exhlogotextfield'),$('#upexhlogoInput'))" >
                                    选择图片
                                </button>
                                <input type="file" style="display:none;" id="upexhlogoInput" name="picLogo"  />
                                <i class="notnull">*</i>
                                <i class="notnull green">建议上传高度约60，宽度约60的图片</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">展会二级logo</label>
                                <div class="col-sm-5 no-padding-right">
                                    <input value="${command.picName}" name="picName" type='text' readonly id="exhtextfield" data-validate="picture" class='form-control' onclick="uploadClick($(this),$('#upexhInput'))" />
                                </div>
                                <button type="button" rel="ajax-upload-avatar" class="btn btn-primary" onclick="uploadClick($('#exhtextfield'),$('#upexhInput'))" >
                                    选择图片
                                </button>
                                <input type="file" style="display:none;" id="upexhInput" name="pic"  />
                                <i class="notnull">*</i>
                                <i class="notnull green">建议上传高度约210，宽度约130的图片</i>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">所属行业</label>
                                <div class="col-sm-5 no-padding-right">
                                    <select id="hySelector" multiple="" class="form-control chosen-select" placeholder="请选择" name="trade" data-validate="required">
                                    </select>
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">关键字</label>
                                <div class="col-sm-5 no-padding-right">
                                    <select id="keywordSelector" multiple="" class="form-control chosen-select" name="keyword" data-validate="required">
                                    </select>
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label no-padding-right">展馆</label>
                                <div class="col-sm-5 no-padding-right">
                                    <select name="hallId" class="form-control" id="hallSelector" data-validate="required">
                                    </select>
                                </div>
                                <i class="notnull">*</i>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-6 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveAdvert(${command.id!=null?"'edit'":"'save'"});">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="descriptionExh">
                        <form class="form-horizontal padding-10" id="exhDescriptionForm">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">展会介绍</label>
                                <div class="col-sm-11">
                                    <script type="text/plain" id="desEditor" style="width:1000px;height:300px;">
                                        <p></p>
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveDes('${command.id}');">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="guideExh">
                        <form class="form-horizontal padding-10"  id="exhGuideForm">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">参展指南</label>
                                <div class="col-sm-11">
                                    <script type="text/plain" id="guideEditor" style="width:1000px;height:240px;">
                                        <p></p>
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveGuide('${command.id}');">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="sponsorExh">
                        <form class="form-horizontal padding-10" id="sponsorForm">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">主办信息</label>
                                <div class="col-sm-11">
                                    <script type="text/plain" id="sponsorEditor" style="width:1000px;height:240px;">
                                        <p></p>
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveSponsor('${command.id}');">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="guidetoExh">
                        <form class="form-horizontal padding-10" id="guidetoForm" style="padding-bottom: 150px">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">出行指南</label>
                                <div class="col-sm-11">
                                    <script type="text/plain" id="guidetoEditor" style="width:1000px;height:240px;">
                                        <p></p>
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveGuideTo('${command.id}');">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-1 control-label">展馆具体位置</label>
                                <div class="col-sm-11">
                                    <div class="table-title green" style="padding-left: 10px;width:1000px;">展馆地图位置</div>
                                    <div id="guideTobaiduMap" style="width:1000px;height:500px;border:1px solid gray"></div>
                                </div>
                            </div>
                        </form>

                    </div>
                    <div role="tabpanel" class="tab-pane" id="travelExh">
                        <form class="form-horizontal padding-10" id="travelForm">
                            <div class="form-group">
                                <label class="col-sm-1 control-label">参展攻略</label>
                                <div class="col-sm-11">
                                    <script type="text/plain" id="travelEditor" style="width:1000px;height:240px;">
                                        <p></p>
                                    </script>
                                </div>
                            </div>
                            <div class="clearfix form-actions clear">
                                <div class="col-md-offset-3 col-md-9 btn-group">
                                    <button type="button" class="btn btn-primary" onclick="saveTravel('${command.id}');">
                                        <span><i class="fa fa-save"></i>保存</span>
                                    </button>
                                    <button type="button" class="btn btn-default" onclick="reloadPage('html/exhibition/security/index');">
                                        <span><i class="fa fa-history"></i>返回</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="newsExh">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<link rel="stylesheet" href="<c:url value="/resources/css/map.css"/>" />--%>
<%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=vGDcVVUlGcuankr8TgcYWsum"></script>--%>
<%--<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>--%>
<script type="text/javascript" src="<c:url value="/resources/lib/map/maplink.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/lib/map/maplib.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/exhibition.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/exhNews.js"/>"></script>
<script type="text/javascript">
    changeMenu($('#menu-exh'));
    initComboData($("#basicInfoExh #hallSelector"),'html/exhibitionHall/list',{start:0,limit:20000},'id','name','${command.hallId}');
    initComboData($("#basicInfoExh #hySelector"),'html/dictionary/security/list',{start:0,limit:20000,Q_type_EQ:4},'id','keyValue','${command.tradeIds}'.split(","));
    initComboData($("#basicInfoExh #keywordSelector"),'html/dictionary/security/list',{start:0,limit:20000,Q_type_EQ:0},'id','keyValue','${command.keywordIds}'.split(','));
    $('#tab-news a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        ajaxReloadPage('newsExh','html/exhNews/security/newsList/${command.id}');
    });
    $('#tab-guideto a').click(function (e) {
        e.preventDefault()
        $(this).tab('show');
        var map = new BMap.Map("guideTobaiduMap");
        var point = new BMap.Point('${command.lng}', '${command.lat}');
        map.centerAndZoom(point, 11);
        var marker = new BMap.Marker(point);
        map.addOverlay(marker);
        var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});
        var top_left_navigation = new BMap.NavigationControl();
        var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL});
        map.addControl(top_left_control);
        map.addControl(top_left_navigation);
        map.addControl(top_right_navigation);
    });


    $(function(){
        $('#hallSelector').chosen();
        $('#hySelector').chosen({
            allow_single_deselect:true,
            placeholder_text:'请选择',
            no_results_text:'未找到相关项'
        });
        $('#keywordSelector').chosen({
            allow_single_deselect:true,
            placeholder_text:'请选择',
            no_results_text:'未找到相关项'
        });
        if(${command.id!=null}){
            var desEditor = UE.getEditor('desEditor');
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
            var guideEditor = UE.getEditor('guideEditor');
            guideEditor.ready(function() {
                var div=$('<div></div>').append('${command.guide}');
                var des = div.find('img').each(function(){
                    var src=$(this).attr('src') || '';
                    var index=src.indexOf("updload/ue");
                    if(index!=-1){
                        src='${command.imgUrl}'+src.substr(index);
                        $(this).attr("src",src);
                    }
                });
                guideEditor.setContent(div.html());
            });
            var sponsorEditor = UE.getEditor('sponsorEditor');
            sponsorEditor.ready(function() {
                var div=$('<div></div>').append('${command.sponsor}');
                var des = div.find('img').each(function(){
                    var src=$(this).attr('src') || '';
                    var index=src.indexOf("updload/ue");
                    if(index!=-1){
                        src='${command.imgUrl}'+src.substr(index);
                        $(this).attr("src",src);
                    }
                });
                sponsorEditor.setContent(div.html());
            });
            var guidetoEditor = UE.getEditor('guidetoEditor');
            guidetoEditor.ready(function() {
                var div=$('<div></div>').append('${command.guideTo}');
                var des = div.find('img').each(function(){
                    var src=$(this).attr('src') || '';
                    var index=src.indexOf("updload/ue");
                    if(index!=-1){
                        src='${command.imgUrl}'+src.substr(index);
                        $(this).attr("src",src);
                    }
                });
                guidetoEditor.setContent(div.html());
            });
            var travelEditor = UE.getEditor('travelEditor');
            travelEditor.ready(function() {
                var div=$('<div></div>').append('${command.travel}');
                var des = div.find('img').each(function(){
                    var src=$(this).attr('src') || '';
                    var index=src.indexOf("updload/ue");
                    if(index!=-1){
                        src='${command.imgUrl}'+src.substr(index);
                        $(this).attr("src",src);
                    }
                });
                travelEditor.setContent(div.html());
            });




        }
    });
</script>
</body>
</html>


