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
    <title>${exh.name}</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <link href="<c:url value="/resources/css/zx_info.css"/> " rel="stylesheet" />
    <style>
        table{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#efefef;}
        th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
        th{font-weight:bold;background:#ccc;}
        #mbnews .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
        #mbtrade .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }

    </style>
</head>
<body style="padding-top: 2px;">
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
<div class="container pb-15">
    <div class="row">
        <div class="span15">
            <div class="label-div b-5 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
                <div class="mmdh"><a href="<c:url value="/html/web/home"/>">首页</a> > <a href="<c:url value="/html/web/exh"/>">会展展会</a> > <span>展会详情</span></div>
                <c:forEach var="keyword" items="${exh.keywordNames}">
                    <div class="mmkey pull-right">
                        <b><a href="javascript:void(0);" style="cursor: default;">${keyword}</a></b>
                    </div>
                </c:forEach>
                <div class="mmclear"></div>

                <div style="margin-top: 14px;" class="clearfix pb-12 pl-25 pr-25">
                    <h1 class="pull-left r-10">${exh.name}</h1>
                    <c:if test="${exh.willStart}">
                        <div class="pull-left pt-5 none-768" style="_margin-top:-33px; _margin-left:-10px;">
                        <span class="like-plug-gz clearfix pull-left r-15">
                        <a style="cursor: default;color: #000;" href="javascript:void(0);" class="like-btn pull-right ie6png">即将开始</a>
                        <span class="count pull-left t-5 d-none"></span>
                        </span>
                        </div>
                    </c:if>
                </div>

                <div style="margin-top: 4px;" class="clearfix pl-25 pr-25">
                    <div class="pull-left">
                        <span class="r-15 pull-left"><span class="fc999 l-5">举办时间：${exh.startDate}至${exh.endDate}</span></span>
                        <span class="r-15 pull-left"><span class="fc999 l-5">涉及行业：${exh.tradeNames}</span></span>

                    </div>
                </div>
                 <div style="margin-top: 4px;" class="clearfix pl-25 pr-25">
                    <div class="pull-left">
                        <span class="r-15 pull-left"><span class="fc999 l-5">展馆：<a href="<c:url value="/html/web/hallDetail/${exh.hallId}"/>">${exh.hallName}</a></span></span>
                        <span class="r-15 pull-left"><span class="fc999 l-5">地址：${exh.address}</span></span>
                    </div>
                     <div class="pull-left">
                         <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="${exh.shareCount}人分享	${exh.commentCount!=null?exh.commentCount:0}人评论" data-id="104417" data-type="news">${exh.commentCount+exh.shareCount}人</a>
                         <a class="read-btn ie6png" href="javascript:void(0);" title="${exh.previewCount}次阅读">${exh.previewCount}次</a>
                     </div>
                </div>
                <!--警告：切勿删除-->
                <!--[if IE 6]> <a class="follow-btn ie6png mmmzw"></a><![endif]-->

            </div>


            <div class="second  label-div border-all pr-5   pb-5 pl-20 clearfix">
                <dl class="mydllist">
                    <dd class="selected" id="mmdesctription"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">展会介绍</a></span><span class="mr"></span></dd>
                    <dd id="mmguideto"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">出行指南</a></span><span class="mr"></span></dd>
                    <dd id="mmnews"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">展会资讯</a></span><span class="mr"></span></dd>
                    <dd id="mmtarvel"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">观展攻略</a></span><span class="mr"></span></dd>
                    <dd id="mmguide"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">参展指南</a></span><span class="mr"></span></dd>
                    <dd id="mmsponsor"><span class="ml"></span><span class="mm"><a  href="javascript:void(0);">主办信息</a></span><span class="mr"></span></dd>
                    <dd id="mmhalldes"><span class="ml"></span><span class="mm"><a target="_blank" href="<c:url value="/html/web/hallDetail/${exh.hallId}"/>">展馆介绍</a></span><span class="mr"></span></dd>
                    <dd id="mmtrade"><span class="ml"></span><span class="mm"><a href="javascript:void(0);">行业资讯</a></span><span class="mr"></span></dd>
                </dl>
            </div>

            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;" id="mbdesctription">
                <div class="view-main t-20 pl-25 pr-25">

                    <div class="view-content" style="margin-top: 18px;" id="mbdesctriptionContent">
                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbguide">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbguideContent">
                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbguideto">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbguidetoContent">
                    </div>
                    <table style="width: 100%;" class="fc333 border-all">
                        <tbody><tr>
                            <td style="padding: 5px 12px;font-size: 22px;text-align: center;background: #E8E8E8; line-height: 30px;color: #999">地图位置</td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="view-content" style="margin-top: 4px;height: 500px;border: 1px solid #E8E8E8;" id="mbguideMap">
                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbnews">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbmbnewsContent">

                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbtarvel">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbtarvelContent">
                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbsponsor">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbsponsorContent">
                    </div>
                </div>
            </div>
            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;display:none;" id="mbtrade">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbtradeContent">

                    </div>
                </div>
            </div>

            <div class="t-10 label-div border-all pr-5   pb-10 pl-20 clearfix">
                <div class="share share-plug">
                    <span style="height: 28px;line-height: 28px;color: #000;" class="pull-left r-10">分享到：</span>
                    <div style="margin-top: 7px;" class="pull-left clearfix">
                        <div class="bshare-custom">
                        </div>
                    </div>
                </div>
            </div>

            <div id="comment_div" class="t-10 label-div border-all pr-20 pt-50 pl-20">
                <div class="comment">
                    <div class="comment_box_comment" id="comment-box">
                        <div class="post-div">
                            <form  id="form_comment" name="form_comment">
                                <div class="user-img">
                                    <a title="${userinfo.nickName!=null?userinfo.nickName:'游客'}" href="javascript:void(0);">
                                        <c:if test="${userinfo.portraitUrl!=null}">
                                            <img alt="${userinfo.nickName!=null?userinfo.nickName:'游客'}" src="${userinfo.portraitUrl}">
                                        </c:if>
                                        <c:if test="${userinfo.portraitUrl==null}">
                                            <img alt="${userinfo.nickName!=null?userinfo.nickName:'游客'}" src="<c:url value="/resources/images/card-icons.jpg"/>">
                                        </c:if>
                                    </a>
                                </div>
                                <div class="weiboComments">
                                    <div class="com-textarea ie6png">
                                        <input type="hidden" value="News" id="data_obj_type" name="data[obj_type]">
                                        <input type="hidden" value="104437" id="data_obj_id" name="data[obj_id]">
                                        <input type="hidden" value="" id="data_uid" name="data[uid]">
                                        <input type="hidden" value="0" id="data_pid" name="data[pid]">
                                        <input type="hidden" value="" id="data_share" name="data[share]">
                                        <input type="hidden" value="aHR0cDovL3d3dy5iaW9kaXNjb3Zlci5jb20vbmV3cy9wb2xpdGljcy8xMDQ0MzcuaHRtbCNDQw==" id="data_url" name="data[url]">
                                        <textarea onblur="if(this.value==''){this.value='有什么感想？你也来说说吧！';$(this).next().val('有什么感想？你也来说说吧！')};textCounter($(this), $(this).parents('form').find('#remLen'),140)" onfocus="if(this.value=='有什么感想？你也来说说吧！'){this.value=''};" onmousemove="textCounter($(this), $(this).parents('form').find('#remLen'),140)" onkeyup="textCounter($(this), $(this).parents('form').find('#remLen'),140);" onkeydown="textCounter($(this), $(this).parents('form').find('#remLen'),140);" id="data_content" name="content" style="_width: 98%;">有什么感想？你也来说说吧！</textarea>
                                        <input type="hidden" value="有什么感想？你也来说说吧！" id="data_content2">
                                        <input type="hidden" value="comment" id="class" name="class">
                                        <span class="head-msg">还可以输入<span id="remLen">140</span>字</span>
                                        <span style="color: #000;position: absolute;left: 0;top: -35px;height: 22px;line-height: 20px;font-family: '微软雅黑';font-size: 14px;">讨论区：</span>
                                    </div>
                                    <div class="post-toolbar">
                                        <a href="javascript:void(0);" id="commentBtn" class="post-button-dis add_comment_submit ie6png">评&nbsp;论</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="commentDiv">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="loginModel" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog width-35">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="icon-cog"></i>用户登录</h4>
            </div>
            <div class="modal-body">
                <div class="label-div border-all" style="padding: 0;">
                    <div class="label-main">
                        <div class="clearfix label-public">
                            <div class=" public-login">
                                <div class="t-25 pl-30 fc333">请填写登录邮箱和密码</div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left fc999" style="width: 60px;">邮箱</div>
                                    <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="text" id="username" name="username" value="" class="span4"/></div>
                                    <span class="pull-left l-20 fcCF261F info username_msg"></span>
                                </div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left fc999" style="width: 60px;">密码</div>
                                    <div class="pull-left l-20" style="_margin-left: 0;width: 100px;"><input type="password" id="password" name="password" value="" class="span4"/></div>
                                    <span class="pull-left l-20 fcCF261F info password_msg"></span>
                                </div>
                                <div class="clearfix pt-25">
                                    <div class="title pull-left" style="margin-left: 6px;_margin-left: 3px;">&nbsp;</div>
                                    <a href="javascript:void(0);" title="登录" onclick="submit_form(this)"  class="pull-left login-register-btn">登&nbsp;录</a>
                                    <div class="pull-left l-20 t-8" style="_width: auto;_margin-left: 15px;">
                                    </div>
                                    <span class="pull-left l-5 info fc999" style="_width: auto;_margin: 0;">
                                        <a class="fc999 l-10" href="<c:url value="/html/web/getPwd"/>" title="忘记密码">忘记密码</a>
                                    </span>
                                </div>
                                <div id="loginFailDiv" class="clearfix pt-25 pl-40 hidden">
                                    <span class="pull-left l-5 info fc999" style="color:red;_width: auto;_margin: 0;">用户名或密码错误</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <a href="javascript:void(0);" data-dismiss="modal"  class="btn-primary pull-right">关闭</a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script id="commentTpl" type="text/template">
    <div class="comments-info clearfix">
        <div class="comments-tab left">
            <a href="javascript:void(0);"><span class="rows_count">{{=it.total}}</span> 条评论</a>
        </div>
    </div>
    {{ if(it.data&&it.data.length>0) { }}
    <ul class="comments-list clearfix">
        {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
        <li class="cleaarfix p1">
            <div class="left post-img">
                <a href="javascript:void(0);" title="{{=it.data[i].nickName}}">
                    {{ if(it.data[i].portraitUrl) { }}
                    <img src="{{=!it.data[i].portraitUrl}}" alt="{{=it.data[i].nickName}}">
                    {{ } }}
                    {{ if(!it.data[i].portraitUrl) { }}
                    <img src="<c:url value="/resources/images/card-icons.jpg"/>" alt="{{=it.data[i].nickName}}">
                    {{ } }}
                </a>
            </div>
            <div class="post-info">
                <div style="line-height: 16px;margin-bottom: 9px;"><a class="fs14 r-10" href="javascript:void(0);" title="jack_radio">{{=(it.data[i].nickName?it.data[i].nickName:'游客')}}</a><span class="fc999">{{=new Date(it.data[i].createDate).format('yyyy-MM-dd hh:mm:ss')}}</span></div>
                <div class="fc666 b-5">
                    {{=it.data[i].content}}
                </div>
            </div>
            <div class="clear"></div>
        </li>
        {{ } }}
    </ul>
    <div id="pagination" class="pagination center pt-20 pull-right">
    </div>
    {{ } }}
</script>

<script id="indexNewsTpl" type="text/template">
    {{ if(it.data&&it.data.length>0) { }}

    <div class="label-main tody-hot l-15">
        <ul>
            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
            <li><a href="<c:url value="/html/web/newsDetail/{{=it.data[i].id}}"/>">{{=it.data[i].title}}</a><span class="pull-right green">{{=new Date(it.data[i].createDate).format('yyyy-MM-dd')}}</span></li>
            {{ } }}
        </ul>

    </div>
    <div id="newsPagination" class="pagination">
    </div>
    {{ } }}
</script>
<script id="exhTradeTpl" type="text/template">
    {{ if(it.data&&it.data.length>0) { }}

    <div class="label-main tody-hot l-15">
        <ul>
            {{ for (var i = 0, l = it.data.length; i < l; i++) { }}
            <li><a href="<c:url value="/html/web/newsDetail/{{=it.data[i].id}}"/>">{{=it.data[i].title}}</a><span class="pull-right green">{{=new Date(it.data[i].createDate).format('yyyy-MM-dd')}}</span></li>
            {{ } }}
        </ul>

    </div>
    <div id="tradePagination" class="pagination">
    </div>
    {{ } }}
</script>


<script type="text/javascript">

    backToTop('body');
    var exhId='${exh.id}',lng='${exh.lng}',lat='${exh.lat}';
    $('#form_comment #commentBtn').click(function(){
    if(${userinfo==null}){
    returnInfo(-1, 0, '您还没有登录，<a href="#loginModel" data-toggle="modal" data-target="#loginModel">立即登录</a>');
    return;
    }

    $(this).removeClass('post-button');
    $(this).addClass('post-button-dis');
    var content=$('#form_comment textarea').val();
    var data= {
    type:'Exhibition',
    content:content
    };
    $.post(appPath+'html/web/comment/Exhibition/'+exhId,data,function(result){
    if(result.success){
    getComment(1);
    $('#form_comment textarea').val('');
    }
    });
    });
</script>
<script src="<c:url value="/resources/lib/web/exhDetail.js"/>"></script>
<script type="text/javascript">
    getComment(1);
    $.get(appPath+'html/web/exhDes/'+exhId,{},function(result){
        $('#mbdesctriptionContent').html(result.data);
    });
</script>

<link rel="stylesheet" href="<c:url value="/resources/css/map.css"/>" />
<script type="text/javascript" ckharset="utf-8" src="<c:url value="/resources/lib/web/bshare.js"/>"></script>
<script type="text/javascript" ckharset="utf-8" src="<c:url value="/resources/lib/web/bsharec0.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/lib/web/maplink.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/lib/web/maplib.js"/>"></script>
<script type="text/javascript">
    iBShare.init();
</script>
</body>
</html>
