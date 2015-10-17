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
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <%@include file="/common/common.jsp" %>
    <%--<link href="<c:url value="/resources/css/tzjg.css"/> " rel="stylesheet" />--%>
    <link href="<c:url value="/resources/css/zx_info.css"/> " rel="stylesheet" />
    <style>
        .pagination ul > li > a, .pagination ul > li > span{
            padding: 4px 7px;
            line-height: 14px;
        }
        .round{
            width:10px;
            height:10px;
            display:inline-block;
            font-size:10px;
            line-heigth:10px;
            text-align:center;
            color:#000;
            text-decoration:none
        }
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:14px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
        table.gridtable td a {
            color: #0188DE;
        }

    </style>

</head>
<body>
<%@include file="header.jsp"%>
<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>
<div class="container pb-15 pt-5">
    <div class="row">
        <div class="span13  pt-40">
            <div class="label-div b-20 border-all pb-10 pt-5  span4" style="width:auto;height:47%; position: relative; padding-left: 0;">
                <div class="index-news-img spanm3  pt-5" style="text-align: center;margin-left: 10px;">
                    <a href="<c:url value="/html/web/repeatyear"/>"   rel="bookmark">
                        <img  style="border: 1px solid;height: 180px;width:100%"  class="lazyloadimg" src="<c:url value="/resources/images/r_year.png"/>"  />
                    </a>
                    <h5>
                        <a   href="<c:url value="/html/web/repeatyear"/>">成都市会展业年度主要指标</a>
                    </h5>
                </div>
            </div>
            <div class="label-div b-20 border-all pb-10 pt-5  span4" style="width:auto;height:47%; position: relative; padding-left: 0;">
                <div class="index-news-img spanm3  pt-5" style="text-align: center;margin-left: 10px;">
                    <a  href="<c:url value="/html/web/repeatexh"/>"   rel="bookmark">
                        <img  style="border: 1px solid;height: 180px;width:100%"  class="lazyloadimg" src="<c:url value="/resources/images/r_exh.png"/>"  />
                    </a>
                    <h5>
                        <a   href="<c:url value="/html/web/repeatexh"/>">展会评估报告</a>
                    </h5>
                </div>
            </div>
            <div class="label-div b-20 border-all pb-10 pt-5  span4" style="width:auto;height:47%; position: relative; padding-left: 0;">
                <div class="index-news-img spanm3  pt-5" style="text-align: center;margin-left: 10px;">
                    <a href="<c:url value="/html/web/repeatcmp"/>"   rel="bookmark">
                        <img  style="border: 1px solid;height: 180px;width:100%"  class="lazyloadimg" src="<c:url value="/resources/images/r_compare.png"/>"  />
                    </a>
                    <h5>
                        <a   href="<c:url value="/html/web/repeatcmp"/>">展会对比评估报告</a>
                    </h5>
                </div>
            </div>

            <div class="label-div b-20 border-all pb-10 pt-5  span4" style="width:auto;height:47%; position: relative; padding-left: 0;">
                <div class="index-news-img spanm3  pt-5" style="text-align: center;margin-left: 10px;">
                    <a  href="<c:url value="/html/web/repeatcity"/>" rel="bookmark">
                        <img  style="border: 1px solid;height: 180px;width:100%"  class="lazyloadimg" src="<c:url value="/resources/images/r_city.png"/>"  />
                    </a>
                    <h5>
                        <a  href="<c:url value="/html/web/repeatcity"/>">主要会展城市指标对比</a>
                    </h5>
                </div>
            </div>
        </div>
        <div class="span3">
            <div class="label-div t-5 border-all">
                <div class="l-15"><h3 style="padding-bottom: 14px;" class="label-title border-b b-20 small clearfix">Android客户端下载</h3></div>
                <div class="l-15 t-5"><img src="${homeCommand.zxUrl}"></div>
                <p style="margin-bottom: 0;" class="l-15 t-5 fc999">使用手机扫一扫，获取手机客户端</p>
            </div>
        </div>

    </div>
</div>

<%--<div class="container">--%>
    <%--<div class="hr"></div>--%>
<%--</div>--%>
<%--<%@include file="footer.jsp"%>--%>

<script type="text/javascript">
    backToTop('body');
    changeNav('nav-appraisal');
</script>

</body>
</html>
