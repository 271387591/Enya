<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/9/15
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container-fluid footer">
    <div class="row" style="background:#EDEDED;">
        <div class="span3 offset7"><a title="联系我们" id="contractUs" href="javascript:void(0);" class="fc666">联系我们</a></div>
        <div class="span3"><a id="zk_btn" title="友情链接" href="javascript:void(0);" class="fc666">友情链接</a></div>
    </div>
    <div id="footerYouqing" class="friend-link border-all t-20 b-20">
        <ul class="clearfix">
            <c:forEach var="fr" items="${homeCommand.friendLinks}">
                <li><a href="${fr.url}" title="${fr.name}" target="_blank" class="fc666">${fr.name}</a></li>
                <li><span>|</span></li>
            </c:forEach>
        </ul>
    </div>
    <div id="footerContract" class="friend-link border-all t-20 b-20">
        <ul class="clearfix">
            <li style="float: none;margin-bottom: 2px;">地址:<span class="green">${homeCommand.address}</span></li>
            <li style="float: none;margin-bottom: 2px;">电话:<span class="green">${homeCommand.phone}</span></li>
            <li style="float: none;margin-bottom: 2px;">邮编:<span class="green">${homeCommand.zipCode}</span></li>
            <li style="float: none;margin-bottom: 2px;">传真:<span class="green">${homeCommand.facsimile}</span></li>
            <li style="float: none;margin-bottom: 2px;">Email:<span class="green">${homeCommand.email}</span></li>
        </ul>
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            var flag = 0;
            $(".friend-link").hide();
            //Down
            $("#zk_btn").click(function(){
                if(flag == 0){
                    $("#footerYouqing").slideDown(400);
                    $(this).removeClass('down-class');
                    $(this).addClass('up-class');
                    $("html,body").animate({scrollTop:($("#footerYouqing").offset().top+2000)},600);
                    flag = 1;
                }else{
                    $(".friend-link").slideUp(400);
                    $(this).removeClass('up-class');
                    $(this).addClass('down-class');
                    flag = 0;
                }
            });
            $("#contractUs").click(function(){
                if(flag == 0){
                    $("#footerContract").slideDown(400);
                    $(this).removeClass('down-class');
                    $(this).addClass('up-class');
                    $("html,body").animate({scrollTop:($("#footerContract").offset().top+2000)},600);
                    flag = 1;
                }else{
                    $(".friend-link").slideUp(400);
                    $(this).removeClass('up-class');
                    $(this).addClass('down-class');
                    flag = 0;
                }
            });

        });
    </script>

    <p>${homeCommand.copyright}　　${homeCommand.icp}</p>

</div>
