<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 6/8/15
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>1111111</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
</head>
<body>
<%@include file="header.jsp"%>

<div class="hr tp-div-nexthr" style="margin-top: 0;margin-bottom: 0;padding: 0;"></div>

<div class="container pb-15">
    <!-- Example row of columns -->
    <div class="row home-index">
        <div class="span13">
            <div class="span8">
                <div class="label-div t-20 border-all">
                    <div class="l-15">
                        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">
                            <a href="#" title="创新项目" class="pull-left r-10">创新项目</a>
							<span class="pull-left">
									            				<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>
																<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>
	            					            				<a href="#" title="分类" class="pull-left">分类</a>

	            											</span>
                            <a href="/news.html" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                    <div class="label-main">
                        <div class="news-slides b-15 l-15">
                            <div class="slides-list slides-banner">
                                <div class="slides-css" style="display:block;">
                                    <a target="_blank" href="#" title="标题标题"  rel="bookmark" >
                                        <img alt="标题标题" src="images/lunbo1.jpg"/>
                                    </a>
                                </div>
                                <div class="slides-css" style="display:none;">
                                    <a target="_blank" href="#" title="标题标题"  rel="bookmark" >
                                        <img alt="标题标题" src="images/lunbo2.jpg"/>
                                    </a>
                                </div>




                                <!--轮播图的小按钮-->
                                <div class="slides-icon slides-banner-point">
                                    <a href="javascript:void(0);" class="icon-css-on ie6png">&nbsp;</a>
                                    <a href="javascript:void(0);" class="icon-css ie6png">&nbsp;</a>


                                </div>
                                <!--轮播图的小按钮结束-->

                            </div>


                            <!--第一组新闻开始-->
                            <div class="slides-title slides-banner-title" style="display:block">
                                <div class="intro">
                                    <h1 class="t-15"><a href="#" title="标题标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题标题标题标题标题标题标题</a></h1>
                                </div>

                                <div class="clearfix t-10 related-news" style="height:45px; overflow:hidden; position:relative;">
                                    <a class="pr-5 fc333 ie6png" href="#" rel="bookmark" title="标题" target="_blank">标题标标题标题1</a>
                                    <a class="pr-5 fc333 ie6png" href="#" rel="bookmark" title="标题" target="_blank">标题标题标标题标题标题标题标标题标题2</a>

                                </div>
                            </div>
                            <!--第一组新闻结束-->

                            <!--第二组新闻结束-->
                            <div class="slides-title slides-banner-title" style="display:none;">
                                <div class="intro">
                                    <h1 class="t-15"><a href="#" title="标题标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题2222222</a></h1>
                                </div>
                                <div class="clearfix t-10 related-news" style="height:45px; overflow:hidden; position:relative;">
                                    <a class="pr-5 fc333 ie6png" href="#" rel="bookmark" title="标题" target="_blank">标题标题标题标题标题1</a>
                                    <a class="pr-5 fc333 ie6png" href="#" rel="bookmark" title="标题" target="_blank">标题标题标题标题1</a>

                                </div>

                            </div>
                            <!--第二组新闻结束-->




                            <script type="text/javascript">
                                $(function(){
                                    var Interval_control = '';
                                    var current_index = 0;
                                    $(".slides-banner .slides-css").hide();
                                    $(".slides-banner .slides-css:first").show();
                                    $(".slides-banner-title").hide();
                                    $(".slides-banner-title:first").show();

                                    show_pic = function(index){
                                        $(".slides-css").each(function(i){
                                            $(this).hide();
                                            if(i == index)
                                            {
                                                $(this).show();
                                            }
                                        });
                                    };

                                    show_content = function(index){
                                        $(".slides-banner-title").each(function(i){
                                            $(this).hide();
                                            if(i == index)
                                            {
                                                $(this).show();
                                            }
                                        });
                                    };

                                    show_point = function(index){
                                        $(".slides-banner-point a").each(function(i){
                                            if($(this).hasClass("icon-css-on"))
                                            {
                                                $(this).removeClass("icon-css-on");
                                                $(this).addClass("icon-css");
                                            }
                                            if(i == index)
                                            {
                                                if($(this).hasClass("icon-css"))
                                                {

                                                    $(this).removeClass("icon-css");
                                                }
                                                $(this).addClass("icon-css-on");
                                            }
                                        });

                                    };

                                    slides = function(){
                                        $(".slides-icon a").each(function(index){
                                            $(this).click(function(){
                                                current_index = index;
                                                show_point(index);
                                                show_content(current_index);
                                                show_pic(current_index);
                                            });
                                        });
                                    };
                                    slides();

                                    Interval_control = setInterval(
                                            function(){
                                                show_point(current_index);
                                                show_content(current_index);
                                                show_pic(current_index);

                                                if (current_index == ($(".slides-banner .slides-css a").length - 1))
                                                {
                                                    current_index = -1;
                                                }

                                                current_index ++;
                                            }
                                            ,
                                            8000
                                    );//设置自动切换函数

                                    //当触发mouseenter事件时，取消正在执行的自动切换方法，触发mouseouter事件时重新设置自动切换
                                    $(".slides-banner .slides-css,.slides-banner-title").mouseenter(function() {
                                        clearInterval(Interval_control);//停止自动切换
                                    }).mouseleave(function() {
                                        Interval_control = setInterval(
                                                function(){
                                                    show_point(current_index);
                                                    show_content(current_index);
                                                    show_pic(current_index);

                                                    if (current_index == ($(".slides-banner .slides-css a").length - 1))
                                                    {
                                                        current_index = -1;
                                                    }

                                                    current_index ++;
                                                }
                                                ,
                                                8000
                                        );//设置自动切换函数

                                    });
                                });
                            </script>
                        </div>

                        <!--图文解说开始-->
                        <div class="hr l-15 t-15 b-20"></div>

                        <!--第一个开始-->
                        <div class="news-list b-30 clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/y.jpg"/>
                                </a>
                            </div>
                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style=" margin-bottom:0px;">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>

                        <!--第一个结束-->


                        <div class="news-list b-30 clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/xj.jpg"/>
                                </a>
                            </div>

                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style=" margin-bottom:0px;">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>


                        <div class="news-list b-30 clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/xj2.jpg"/>
                                </a>
                            </div>
                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style=" margin-bottom:0px;">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>

                        <div class="news-list b-30 clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/y.jpg"/>
                                </a>
                            </div>
                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style=" margin-bottom:0px;">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>

                        <div class="news-list b-30 clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/xj.jpg"/>
                                </a>
                            </div>
                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style="margin:5px 0 0 0; padding:0px; font-family:'微软雅黑';">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北2京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>

                        <div class="news-list clearfix">
                            <div class="spanm3 pull-left" style="padding-top:7px;">
                                <a href="#" rel="bookmark" title="标题" style="display: block;" target="_blank">
                                    <img src="images/xj2.jpg"/>
                                </a>
                            </div>
                            <div class="offsetindex3 intro">
                                <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                <p class="t-5 fc666" style=" margin-bottom:0px;">标题标题标标题标题标题标题标题标题题标题标题标题标题标题标题题标题标题标题标题标题。</p>
                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png news-follow-btn" href="javascript:void(0);" title="1人关注	2人分享	3人评论" data-id="104423" data-type="news">6人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="370次阅读">370次</a>
                                </div>
                            </div>
                        </div>




                        <script type="text/javascript">
                            /**
                             $(".news-follow-btn").bind('mouseover', function(){
		if(!$(this).attr("title"))
		{
			var obj_id = $(this).attr("data-id");
			var obj_type = $(this).attr("type-id");
			//Ajax请求数据
			$(this).attr("title",'2人分享	6人评论	12人关注');
		}
	});**/
                        </script>
                    </div>
                </div>
            </div>




            <div class="span5">
                <div class="label-div t-20 border-all">

                    <!--栏目展示-->
                    <div class="l-15 mmtop">
                        <h3 class="label-title border-b small clearfix" style="padding-bottom: 14px; margin-bottom:14px;">
                            <a href="#" title="创新咨讯" class="pull-left r-10">创新咨讯</a>
                <span class="pull-left">
                    <a href="#" title="分类" class="pull-left">分类</a>

                    <a href="#" title="分类" class="pull-left">分类</a>
                    <a href="#" title="分类" class="pull-left">分类</a>

                </span>
                            <a href="/topic.html" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>
                    <!--栏目展示结束-->


                    <div class="label-main">

                        <!--内容介绍第一个-->
                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题1" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i2.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>
                        <!--内容介绍第一个结束-->


                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题1" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i2.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>



                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i3.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>



                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i4.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>



                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i5.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>



                        <div class="topic-list b-45">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i6.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class="t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>



                        <div class="topic-list">

                            <div class="clearfix">
                                <div class="span1 pull-left">
                                    <a href="#" rel="bookmark" title="标题标题标题标题" target="_blank">
                                        <img class="lazyloadimg" alt="标题标题" src="images/i7.jpg"/>
                                    </a>
                                </div>

                                <div class="offset1 intro">
                                    <h1><a href="#" title="标题" rel="bookmark" target="_blank">标题标题标题标题标题标题标题标题</a></h1>
                                </div>
                            </div>

                            <div class="intro l-20">
                                <p class=" t-15 fc666 mmbuttom">标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题。</p>
                                <div class="clearfix">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="1人关注">1人</a>
                                    <a class="read-btn ie6png" href="javascript:void(0);" title="277次浏览">277次</a>
                                </div>
                            </div>

                        </div>




                    </div>
                </div>
            </div>



            <!--项目展示-->
            <div class="span13">
                <div class="label-div t-30 border-all">


                    <div class="l-15">
                        <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">
                            <a href="/talk.html" title="访谈" class="pull-left r-10">项目展示</a>
            <span class="pull-left">
                <a href="#" title="分类" class="pull-left">分类</a>
                <a href="#" title="分类" class="pull-left">分类</a>
                <a href="#" title="分类" class="pull-left">分类</a>
                <a href="#" title="分类" class="pull-left">分类</a>
                <a href="#" title="分类" class="pull-left">分类</a>
            </span>
                            <a href="#" title="更多" class="more-add ie6png pull-right">&nbsp;</a>
                        </h3>
                    </div>


                    <div class="label-main clearfix" style="padding-left: 16px;">
                        <div class="clearfix">

                            <!--项目展示第一个--->
                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>
                            <!--项目展示第一个结束--->




                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                        </div>



                        <div class="clearfix">

                            <!--项目展示第一个--->
                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>
                            <!--项目展示第一个结束--->




                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                        </div>



                        <div class="clearfix">

                            <!--项目展示第一个--->
                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>
                            <!--项目展示第一个结束--->




                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left pr-20">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x1.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                            <div class="video-list b-30 pull-left">

                                <div class="clearfix">
                                    <div class="video-img">
                                        <a href="#" title="标题" target="_blank" rel="bookmark" >
                                            <img class="lazyloadimg" src="images/x2.jpg" alt="标题标题"/>

                                        </a>
                                    </div>
                                </div>

                                <div style="margin-top: 8px;">
                                    <h1><a href="#" title="标题标题标题" rel="bookmark" target="_blank">标题标题标题</a></h1>
                                </div>

                                <p class="fc666 t-5" style="margin-bottom:0px; height:50px;">标题标题标题标题题标题标题标题标题标题标题标题标题标题标题...</p>

                                <div class="myxm"><span><a href="">北京</a></span>  <span class="two"><a href="">项目分类</a></span>   2013/03/02</div>

                                <div class="clearfix t-10">
                                    <a class="follow-btn pr-10 ie6png" href="javascript:void(0);" title="78人关注	78人分享	0人评论">1人</a>
                                    <a class="watch-btn ie6png" href="javascript:void(0);" title="4552次观看">277次</a>
                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>

        </div>


        <!--右侧栏目--->

        <div class="span3">



            <div class="label-div t-20 border-all">
                <div class="l-15"><h3 style="padding-bottom: 14px;" class="label-title border-b b-20 small clearfix">Android客户端下载</h3></div>
                <div class="l-15 t-20" id="androidQr"></div>
                <p style="margin-bottom: 0;" class="l-15 t-5 fc999">手机扫一扫</p>
            </div>
            <div class="t-5 l-50" id="androidPac"><a target="_blank" class="btn btn-default" href="#">下载至电脑</a></div>




            <div class="label-div t-20 border-all">
                <div class="l-15">
                    <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">最新公告</h3></div>
                <div class="label-main tody-hot l-15" >
                    <ul class="demo2">
                        <li class="fa fa-hand-o-right"><a href="">标题标题标题标题标题标题题标题1</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题2</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题3</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题4</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题5</a></li>
                        <li><a href="">标题标题标题标题标题标题标 标题6</a></li>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题7</a></li>--%>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题8</a></li>--%>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题9</a></li>--%>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题10</a></li>--%>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题11</a></li>--%>
                        <%--<li><a href="">标题标题标题标题标题标题标题标题12</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                        <%--<li class="news-item">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in venenatis enim... <a href="#">Read more...</a></li>--%>
                    </ul>
                </div>
            </div>


            <div class="label-div t-30 border-all">
                <div class="l-15">
                    <h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">关注咨询</h3>
                </div>
                <div class="label-main tody-hot l-15" >
                    <ul>
                        <li><a href="">标题标题标题标题标题标题题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标 标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                    </ul>
                </div>
            </div>




            <div class="t-30"><a href="/image.html" target="_blank"><img src="images/swtk.png"/></a></div>


            <div class="label-div t-30 border-all">
                <div class="l-15"><h3 class="label-title border-b b-15 small clearfix" style="padding-bottom: 14px;">合作机构</h3></div>
                <div class="label-main tody-hot l-15" >
                    <ul>
                        <li><a href="">标题标题标题标题标题标题题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                        <li><a href="">标题标题标题标题标题标题标题标题</a></li>
                    </ul>
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
    androidQr();
    $(".demo2").bootstrapNews({
        newsPerPage: 8,
        autoplay: true,
        pauseOnHover: true,
        navigation: false,
        direction: 'down',
        newsTickerInterval: 2500,
        onToDo: function () {
        }
    });
</script>


</body>
</html>
