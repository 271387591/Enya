<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 7/22/15
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="hall" items="${halls}" varStatus="h">
    <div class="label-div b-20 border-all pb-10 pt-5 ${h.index%2==0?"pull-left":"pull-right"}" style="width:47%;height: 150px; position: relative; padding-left: 0;">
        <div class="clearfix pt-3">
            <div class="index-news-img spanm3 pull-left pt-5">
                <a href="<c:url value="/html/web/hallDetail/${hall.id}"/>" title="${hall.name}" target="_blank" rel="bookmark">
                    <img  class="lazyloadimg" alt="${hall.name}" src="${hall.logo1Url}"/>
                </a>
            </div>
            <div class="offset3 intro mmwidth">
                <h1>
                    <a title="${hall.name}" target="_blank" href="<c:url value="/html/web/hallDetail/${hall.id}"/>">${hall.name}</a>
                </h1>
                <div class="" style="height:auto;margin-top:0px;">
                    <div class="myxx">
                        <i class="l">地址：</i>
                        <i class="two">${hall.address}</i>
                    </div>

                    <div>&nbsp;</div>
                    <div>
                        <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="${hall.shareCount}人分享 ${hall.commentCount!=null?hall.commentCount:0}人评论" data-id="104417" data-type="news">${hall.shareCount+hall.commentCount}人</a>
                        <a class="read-btn ie6png" href="javascript:void(0);" title="${hall.previewCount}次阅读">${hall.previewCount}次</a>
                    </div>
                    <c:if test="${hall.hasExh}">
                        <div class="green">
                            <a class=" pr-10 green" style="cursor: default;" href="javascript:void(0);">近期有展会</a>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</c:forEach>






