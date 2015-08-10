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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${command.title}</title>
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
    </style>


</head>
<body style="padding-top: 2px;">
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
<div class="container pb-15">
    <div class="row">
        <div class="span15">
            <div class="label-div b-5 border-all pt-5 t-20" style="position: relative; padding-left: 0;">
                <div class="mmdh"><a href="<c:url value="/html/web/home"/>">首页</a> > <a href="<c:url value="/html//web/exhservice"/>">会展服务</a> > <span>正文</span></div>

                <div class="mmclear"></div>

                <div style="margin-top: 14px;" class="clearfix pb-12 pl-25 pr-25">
                    <h1 class="pull-left r-10">${command.title}</h1>
                </div>

                <div style="margin-top: 4px;" class="clearfix pl-25 pr-25">
                    <div class="pull-left">
                        <span class="r-15 pull-left"><span class="fc999 l-5">时间：<fmt:formatDate value="${command.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span></span>
                    </div>
                    <div class="pull-left">
                        <a class="follow-btn pr-10 ie6png" style="cursor: default" href="javascript:void(0);">来源：</a>
                        <span>${command.source}</span>
                    </div>

                </div>
                <!--警告：切勿删除-->
                <!--[if IE 6]> <a class="follow-btn ie6png mmmzw"></a><![endif]-->

            </div>


            <div class="label-div b-10 border-all pt-5 t-5" style="position: relative; padding-left: 0;" id="mbdesctription">
                <div class="view-main t-20 pl-25 pr-25">
                    <div class="view-content" style="margin-top: 18px;" id="mbdesctriptionContent">
                        ${command.content}
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
        </div>
    </div>
</div>
<div class="container">
    <div class="hr"></div>
</div>
<%@include file="footer.jsp"%>
<script type="text/javascript">
    backToTop('body');
    var newsId='${news.id}';
</script>

<script type="text/javascript" ckharset="utf-8" src="<c:url value="/resources/lib/web/bshare.js"/>"></script>
<script type="text/javascript" ckharset="utf-8" src="<c:url value="/resources/lib/web/bsharec0.js"/>"></script>
<script type="text/javascript">
    var iBShare = {
        init: function() {
            var $shareBox = $(".bshare-custom");
            var tools = '<a title="分享到QQ空间" class="bshare-qzone"></a>';
            tools += '<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>';
            tools += '<a title="分享到人人网" class="bshare-renren"></a>';
            tools += '<a title="分享到腾讯微博" class="bshare-qqmb"></a>';
            tools += '<a title="分享到网易微博" class="bshare-neteasemb"></a>';
            tools += '<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>';
            $shareBox.append(tools);
            $shareBox.children("a").click(function() {
                var parents = $(this).parent();
            });
        }
    };
    iBShare.init();
</script>
</body>
</html>
