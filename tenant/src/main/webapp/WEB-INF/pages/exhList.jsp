<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 7/22/15
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="exh" items="${exhs}" varStatus="h">
    <div class="label-div b-30 border-all pb-20 pt-5" style="position: relative; padding-left: 0;height: 120px;">
        <div class="pl-20" style="margin-left: 1px;margin-top: 3px;">
            <a class="fc1D6597" style="cursor: default;" href="javascript:void(0);">&nbsp;</a>
        </div>
        <div class="news-list">
            <div class="clearfix none-768 pl-20" style="position: absolute;top: 0;right: 15px;">
                <c:forEach var="keyword" items="${exh.keywordNames}">
                    <a class="tags-box l-10 fc999 pull-left" style="cursor: default;" title="${keyword}" href="javascript:void(0);">${keyword}</a>
                </c:forEach>
            </div>
            <div class="clearfix pt-3">
                <div class="index-news-img spanm2 pull-left pt-5">
                    <a href="<c:url value="/html/web/exhDetail/${exh.id}"/>" title="${exh.name}" target="_blank" rel="bookmark">
                        <img id="exhLogoImg" class="lazyloadimg" style="overflow: hidden;border: 1px solid #bababa;width: 168px;height: 104px" alt="${exh.name}" src="${exh.picUrl}"/>
                    </a>
                </div>
                <div class="offset3 intro">
                    <h1>
                        <a title="${exh.name}" target="_blank" href="<c:url value="/html/web/exhDetail/${exh.id}"/>">${exh.name}</a>
                    </h1>

                    <div class="clearfix" style="height: 22px;margin-top: 0px;">
                        <div class="pull-left myxx">

                            <i class="m"><a href="<c:url value="/html/web/hallDetail/${exh.hallId}"/>" target="_blank">${exh.hallName}</a></i>
                            <i class="m">${exh.startDate}至${exh.endDate}</i>
                        </div>

                        <div class="pull-right">
                            <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="${exh.shareCount}人分享	${exh.commentCount!=null?exh.commentCount:0}人评论" data-id="104417" data-type="news">${exh.commentCount+exh.shareCount}人</a>
                            <a class="read-btn ie6png" href="javascript:void(0);" title="${exh.previewCount}次阅读">${exh.previewCount}次</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

