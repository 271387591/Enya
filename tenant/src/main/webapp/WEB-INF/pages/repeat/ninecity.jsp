<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.UnsupportedEncodingException" %>
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
    <%
        String rname=request.getParameter("name");
        try {
            rname= URLDecoder.decode(rname, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    %>
    <title><%=rname%></title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <link rel="icon" href="<c:url value="/resources/images/favicon.ico"/> ">
    <style>
        .ibox-content > .chart{
            min-height: 400px;
        }
    </style>
    <link rel="stylesheet" href="<c:url value="/resources/lib/echarts/asset/css/runtime.css"/> ">
    <script type="text/javascript">
        var appPath='<c:url value="/"/>';
        var baseurl='${command.url}';
    </script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/plugin.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/echarts.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/lib/echarts/asset/js/repeat.js"/>"></script>


</head>
<body style="background:#f3f3f4">
<div class="row navbar-fixed-top">
    <div class="col-lg-12" >
        <ol class="breadcrumb" style="border-radius:0;padding: 10px;padding-left: 50px">
            <li>
                <a href="<c:url value="/html/web/appraisal"/>">首页</a>
            </li>
            <li>
                <a href="<c:url value="/html/web/repeatcity"/>">主要会展城市指标对比</a>
            </li>
            <li class="active">
                <%=rname%>
            </li>

        </ol>
    </div>
</div>
<div id="wrapper" style="margin-top: 40px">
    <div id="content-wrapper">
        <div class="alert alert-info" align="center" style="margin-bottom:1px;border-radius:0">
            <span style="font-size: 20px"><%=rname%></span>
        </div>
        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
                <div class="col-lg-12" >
                    <div class="ibox float-e-margins" id="main0Div" style="display: none;">
                        <div class="ibox-title">
                            <h5>概要描述</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >
                            <div id="main0">

                            </div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>规模以上展会数量前十名</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main1" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main1Desc"></div>

                        </div>
                    </div>

                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>规模以上展会展出总面积前十名</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main2" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main2Desc"></div>
                        </div>
                    </div>

                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>承接规模以上流动展会数量前十名</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main3" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main3Desc"></div>
                        </div>
                    </div>

                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>承接规模以上流动展会展出总面积前十名</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main4" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main4Desc"></div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>城市单体展馆年度展出总面积前十名</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main5" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main5Desc"></div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>成都与其他城市 室内展厅总面积对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main6" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main6Desc"></div>
                        </div>
                    </div>
                     <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>成都与其他城市 年度总展出面积对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main7" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main7Desc"></div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>成都与中西部城市 单体展馆年度展出总面积对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main8" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main8Desc"></div>
                        </div>
                    </div>
                     <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>成都与一线城市 单体展馆年度展出总面积对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main9" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main9Desc"></div>
                        </div>
                    </div>
                    <div class="ibox float-e-margins" style="display: none;">
                        <div class="ibox-title">
                            <h5>成都与沿海城市 单体展馆年度展出总面积对比</h5>
                            <div class="ibox-tools">
                                <a class="collapse-link">
                                    <i class="fa fa-chevron-up"></i>
                                </a>
                            </div>
                        </div>
                        <div class="ibox-content" >

                            <div id="main10" class="chart">

                            </div>
                            <div style="min-height: 1px" id="main10Desc"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
    function ex_area_rp(ex_area_s,title,legend,yAxis){
        var ex_area= ex_area_s;
        var axis=[],series=[];
        for(var i in ex_area){
            axis.push(i);
            series.push(ex_area[i]);
        }
        var opt_ex_area = {
            title : {
                x:'center',
                text: title
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                y:'bottom',
                data:[legend]
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : axis
                }
            ],
            yAxis : [
                {
                    name:yAxis,
                    type : 'value'
                }
            ],
            series : [
                {
                    name:yAxis,
                    type:'bar',
                    data:series,
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    },
                    markLine : {
                        data : [
                            {type : 'average', name: '平均值'}
                        ]
                    }
                }
            ]
        };
        return opt_ex_area;
    }
    function chart(ec,id,opt){
        var chartContainer = document.getElementById(id);
        var myChart = ec.init(chartContainer);
        myChart.setOption(opt);
    }

    require.config({
        paths: {
            echarts: appPath+'resources/lib/echarts'
        }
    });
    require(
            [
                'echarts',
                'echarts/chart/line',
                'echarts/chart/bar'
            ],

            function DrawEChart(ec) {

                var url=baseurl+'nine/';
                var url2=baseurl;
                var rid='${command.id}';
                <%--$.getJSON(url2+'describe/${command.id}',function(result){--%>
                    <%--if(!result.zero){--%>
                        <%--$('#main0Div').hide();--%>
                    <%--}else{--%>
                        <%--$('#main0').html(result.zero);--%>
                    <%--}--%>

                    <%--$('#main1Desc').html(result.one);--%>
                    <%--$('#main1Desc').html(result.one);--%>
                    <%--$('#main2Desc').html(result.two);--%>
                    <%--$('#main3Desc').html(result.three);--%>
                    <%--$('#main4Desc').html(result.four);--%>
                    <%--$('#main5Desc').html(result.five);--%>
                    <%--$('#main6Desc').html(result.six);--%>
                    <%--$('#main7Desc').html(result.seven);--%>
                    <%--$('#main8Desc').html(result.eight);--%>
                    <%--$('#main9Desc').html(result.nine);--%>
                    <%--$('#main10Desc').html(result.ten);--%>

                <%--});--%>
                $.getJSON(url+'control/${command.id}',function(result){
                    var control=result.control;
                    control=control.substr(0,10);
                    var control1=control.substr(0,1),
                            control2=control.substr(1,1),
                            control3=control.substr(2,1),
                            control4=control.substr(3,1),
                            control5=control.substr(4,1),
                            control6=control.substr(5,1),
                            control7=control.substr(6,1),
                            control8=control.substr(7,1),
                            control9=control.substr(8,1),
                            control10=control.substr(9,1);
                    $.getJSON(url2+'describe/${command.id}',function(result){
                        if(result.zero){
                            $('#main0').html(result.zero);
                            $('#main0').closest('.ibox').show();
                        }
                        if(result.one){
                            $('#main1Desc').html(result.one);
                            $('#main1Desc').closest('.ibox').show();
                        }
                        if(result.two){
                            $('#main2Desc').html(result.two);
                            $('#main2Desc').closest('.ibox').show();
                        }
                        if(result.three){
                            $('#main3Desc').html(result.three);
                            $('#main3Desc').closest('.ibox').show();
                        }

                        if(result.four){
                            $('#main4Desc').html(result.four);
                            $('#main4Desc').closest('.ibox').show();
                        }
                        if(result.five){

                            $('#main5Desc').html(result.five);
                            $('#main5Desc').closest('.ibox').show();
                        }
                        if(result.six){
                            $('#main6Desc').html(result.six);
                            $('#main6Desc').closest('.ibox').show();
                        }
                        if(result.seven){
                            $('#main7Desc').html(result.seven);
                            $('#main7Desc').closest('.ibox').show();
                        }
                        if(result.eight){
                            $('#main8Desc').html(result.eight);
                            $('#main8Desc').closest('.ibox').show();
                        }
                        if(result.nine){
                            $('#main9Desc').html(result.nine);
                            $('#main9Desc').closest('.ibox').show();
                        }
                        if(result.ten){
                            $('#main10Desc').html(result.ten);
                            $('#main10Desc').closest('.ibox').show();
                        }
                        if(control1=='1'){
                            $.getJSON(url+'overscale_num/'+rid,function(data){
                                var ex_area_opt=ex_area_rp(data,'规模以上展会数量前十名','展会数量（个）','展会数量（个）');
                                chart(ec,'main1',ex_area_opt);
                            });
                            $('#main1').closest('.ibox').show();
                        }else{
                            $('#main1').hide();
                            $('#main1').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control2=='1'){
                            $.getJSON(url+'overscale_area/'+rid,function(data){

                                var venue_area=ex_area_rp(data,'规模以上展会展出总面积前十名','总面积','总面积');
                                chart(ec,'main2',venue_area);
                            });
                            $('#main2').closest('.ibox').show();
                        }else{
                            $('#main2').hide();
                            $('#main2').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control3=='1'){
                            $.getJSON(url+'flowexhibi_num/'+rid,function(data){
                                var ex_num=ex_area_rp(data,'承接规模以上流动展会数量前十名','展会数量（个）','展会数量（个）');
                                chart(ec,'main3',ex_num);
                            });
                            $('#main3').closest('.ibox').show();
                        }else{
                            $('#main3').hide();
                            $('#main3').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control4=='1'){
                            $.getJSON(url+'flowexhibi_area/'+rid,function(data){
                                var confe_num=ex_area_rp(data,'承接规模以上流动展会展出总面积前十名','总面积','总面积');
                                chart(ec,'main4',confe_num);
                            });
                            $('#main4').closest('.ibox').show();
                        }else{
                            $('#main4').hide();
                            $('#main4').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control5=='1'){
                            $.getJSON(url+'sinexhihall_area/'+rid,function(data){
                                var w_num3=ex_area_rp(data,'城市单体展馆年度展出总面积前十名','总面积','总面积');
                                chart(ec,'main5',w_num3);
                            });
                            $('#main5').closest('.ibox').show();
                        }else{
                            $('#main5').hide();
                            $('#main5').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control6=='1'){
                            $.getJSON(url+'allexhihall_area/'+rid,function(data){
                                var w_area3=ex_area_rp(data,'成都与其他城市室内展厅总面积对比','总面积','总面积');
                                chart(ec,'main6',w_area3);
                            });
                            $('#main6').closest('.ibox').show();
                        }else{
                            $('#main6').hide();
                            $('#main6').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control7=='1'){
                            $.getJSON(url+'all_area/'+rid,function(data){
                                var w_area3=ex_area_rp(data,'成都与其他城市年度总展出面积对比','总面积','总面积');
                                chart(ec,'main7',w_area3);
                            });
                            $('#main7').closest('.ibox').show();
                        }else{
                            $('#main7').hide();
                            $('#main7').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control8=='1'){
                            $.getJSON(url+'western_contest/'+rid,function(data){
                                var w_area3=ex_area_rp(data,'成都与中西部城市单体展馆年度展出总面积对比','总面积','总面积');
                                chart(ec,'main8',w_area3);
                            });
                            $('#main8').closest('.ibox').show();
                        }else{
                            $('#main8').hide();
                            $('#main8').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control9=='1'){
                            $.getJSON(url+'firsttier_contest/'+rid,function(data){
                                var w_area3=ex_area_rp(data,'成都与一线城市单体展馆年度展出总面积对比','总面积','总面积');
                                chart(ec,'main9',w_area3);
                            });
                            $('#main9').closest('.ibox').show();
                        }else{
                            $('#main9').hide();
                            $('#main9').closest('.ibox').find('.ibox-title h5').hide();
                        }
                        if(control10=='1'){
                            $.getJSON(url+'coastal_contest/'+rid,function(data){
                                var w_area3=ex_area_rp(data,'成都与沿海城市单体展馆年度展出总面积对比','总面积','总面积');
                                chart(ec,'main10',w_area3);
                            });
                            $('#main10').closest('.ibox').show();
                        }else{
                            $('#main10').hide();
                            $('#main10').closest('.ibox').find('.ibox-title h5').hide();
                        }

                    });

                });
            }
    );
</script>

</body>
</html>
