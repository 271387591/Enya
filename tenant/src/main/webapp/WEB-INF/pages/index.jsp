<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/8/15
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <link href="<c:url value="/resources/css/index.css"/> " rel="stylesheet" />
    <style>
        #hallAdvertImg{
            border:0;
            margin:0;
            padding:0;
            max-width:619px;
            width:expression(this.width>220px?"220px":this.width);
            max-height:260px;
            height:expression(this.height>260px?"260px":this.height);
            overflow:hidden;
        }

    </style>
</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <div class="row home-index">
        <div class="span13">
            <div class="span8">
                <div class="label-div t-20 border-all">
                    <div class="l-15">
                        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">
                            <a href="javascript:void(0);" style="cursor: default;" class="pull-left r-10">热门展馆</a>
                            <a href="<c:url value="/html/web/hall"/>" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                    <div class="label-main">
                        <div class="news-slides b-15 l-15" id="HallAdvert">
                            <script id="hallAdvertTpl" type="text/template">
                                {{ if(it.data) { }}
                                    <div class="slides-list slides-banner">
                                        {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                                            <div class="slides-css" style="display:none;height:260px;">
                                                <a target="_blank" href="<c:url value="/html/web/hallDetail/{{=it.data[i].id}}"/>" title="{{=it.data[i].name}}"  rel="bookmark" >
                                                    <img id="hallAdvertImg" alt="{{=it.data[i].name}}" src="{{=it.data[i].logo2Url}}"/>
                                                </a>
                                            </div>

                                        {{ } }}
                                        <div class="slides-icon slides-banner-point" >
                                            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                                                <a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
                                            {{ } }}
                                        </div>
                                    </div>

                                    {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                                        <div class="slides-title slides-banner-title" style="display:none">
                                            <div class="intro">
                                                <h1 class="t-15"><a href="<c:url value="/html/web/hallDetail/{{=it.data[i].id}}"/>" title="{{=it.data[i].name}}" rel="bookmark" target="_blank">{{=it.data[i].name}}</a></h1>
                                            </div>

                                            <div class="clearfix t-10 related-news" style="height:45px; overflow:hidden; position:relative;">
                                                地址：{{=it.data[i].address}}
                                            </div>
                                        </div>
                                    {{ } }}
                                {{ } }}
                            </script>
                        </div>
                        <div class="hr l-15 t-15 b-20"></div>
                        <div id="hotHallDiv">
                            <script id="hallListTpl" type="text/template">
                                {{ if(it.data) { }}
                                {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                                <div class="news-list b-30 clearfix">
                                    <div class="spanm3 pull-left" style="padding-top:7px;">
                                        <a href="<c:url value="/html/web/hallDetail/{{=it.data[i].id}}"/>" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                            <img src="{{=it.data[i].logo1Url}}"/>
                                        </a>
                                    </div>
                                    <div class="offsetindex3 intro">
                                        <h1><a href="<c:url value="/html/web/hallDetail/{{=it.data[i].id}}"/>" title="{{=it.data[i].name}}" rel="bookmark" target="_blank">{{=it.data[i].name}}</a></h1>
                                        <div class="myxm"><span>地址：</span><span class="two">{{=it.data[i].address}}</span> </div>
                                        {{ if(it.data[i].hasExh) { }}
                                        <div><span class="label green arrowed arrowed-righ">近期有展会</span> </div>
                                        {{ } }}
                                        <div class="clearfix">
                                            <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                            <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                        </div>
                                    </div>
                                </div>
                                {{ } }}
                                {{ } }}
                            </script>
                        </div>

                    </div>
                </div>
            </div>


            <div class="span5">
                <div class="label-div t-20 border-all">

                    <!--栏目展示-->
                    <div class="l-15 mmtop">
                        <h3 class="label-title border-b small clearfix" style="padding-bottom: 14px; margin-bottom:14px;">
                            <a href="javascript:void(0);" style="cursor: default;" title="最近展会" class="pull-left r-10">最近展会</a>
                            <a href="<c:url value="/html/web/exh"/>" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                    <!--栏目展示结束-->
                    <div class="label-main" id="exhListDiv">
                        <!--内容介绍第一个-->

                        <script id="exhListTpl" type="text/template">
                            {{ if(it.data) { }}
                            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
                            <div class="topic-list b-45">
                                <div class="clearfix">
                                    <div class="span1 pull-left">
                                        <a href="<c:url value="/html/web/exhDetail/{{=it.data[i].id}}"/>" rel="bookmark" title="{{=it.data[i].name}}" target="_blank">
                                            <img class="lazyloadimg" alt="{{=it.data[i].name}}" src="{{=it.data[i].logoUrl?it.data[i].logoUrl:''}}"/>
                                        </a>
                                    </div>

                                    <div class="offset1 intro">
                                        <h1><a href="<c:url value="/html/web/exhDetail/{{=it.data[i].id}}"/>" title="标题" rel="bookmark" target="_blank">{{=it.data[i].name}}</a></h1>
                                        <div class="myxm"><span>展馆：</span><span class="two">{{=it.data[i].address}}</span> </div>
                                        <div class="myxm"><span>时间：</span><span class="two">{{=it.data[i].startDate}}至{{=it.data[i].endDate}}</span> </div>
                                    </div>
                                </div>
                                <div class="intro l-20">
                                    <div class="clearfix">
                                        <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                        <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                    </div>
                                </div>
                            </div>
                            {{ } }}
                            {{ } }}
                        </script>

                    </div>
                </div>
            </div>
        </div>
        <!--右侧栏目--->
        <div class="span3">
            <%@include file="righter.jsp"%>
        </div>
    </div>
</div>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript" src="<c:url value="/resources/lib/web/index.js"/>"></script>
<script type="text/javascript">

    backToTop('body');
    changeNav('nav-index');
</script>
</body>
</html>
