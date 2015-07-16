<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/taglibs.jsp" %>
    <title>展馆管理</title>
</head>
<body>
<%@ include file="../menu.jsp" %>
<div id="right-box" class="right-box">
    <%@ include file="../header.jsp" %>
    <div id="mainContent">
        <ul class="breadcrumb">
            <li class="active">展馆列表</li>
        </ul>
        <div class="right-content" >
            <div class="query-box">
                <div class="query-content">
                    <ul class="query-form" id="userSearch">
                        <li>
                            <label>展馆名称</label>
                            <input type="text" name="user.Q_name_LK">
                        </li>
                        <li>
                            <label>地址</label>
                            <input type="text" name="user.Q_address_LK">
                        </li>
                        <input type="hidden" name="user.hot"/>
                    </ul>
                    <div class="btn-query">
                        <button class="btn btn-success" id="searchBtn">查询</button>
                        <button class="btn btn-default" id="clearBtn">清空</button>
                    </div>
                </div>
            </div>
            <div class="table-box">
                <div class="table-title">
                    <button class="btn btn-primary btn-add" onclick="edit();">添加</button>
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="tab-generalHall" role="presentation" class="active"><a href="#generalHall" aria-controls="home" role="tab" data-toggle="tab">普通展馆</a></li>
                        <li id="tab-hotHall" role="presentation"><a href="#hotHall" aria-controls="profile" role="tab" data-toggle="tab">热门展馆</a></li>
                    </ul>

                </div>
                <div class="clear"></div>


                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="generalHall">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="generalHallTable">
                                <thead>
                                <tr>
                                    <th>展馆名称</th>
                                    <th>地址</th>
                                    <%--<th>展馆介绍</th>--%>
                                    <th>录入时间</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="table-bottom">
                            <div id="generalHallTablePager" class="paging"></div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="hotHall">

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="hotHallTable">
                                <thead>
                                <tr>
                                    <th>展馆名称</th>
                                    <th>地址</th>
                                    <%--<th>展馆介绍</th>--%>
                                    <th>修改时间</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>

                        <div class="table-bottom">
                            <div id="hotHallTablePager" class="paging"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>





    </div>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/admin/exh/hall.js"/>"></script>
<script type="text/javascript">
    jQuery(function($) {
        changeMenu($('#menu-hall'));
        jQuery(function(){
//            initList(0);
//            listGenTable();
            var tabIndex=0;
            initList(tabIndex);
//            $('#tab-generalHall a').click(function (e) {
//                e.preventDefault()
//                $(this).tab('show');
//                listGenTable();
//                tabIndex=0;
//                $('#userSearch input[name="user.hot"]').val(tabIndex);
//            });
//            $('#tab-hotHall a').click(function (e) {
//                e.preventDefault()
//                $(this).tab('show');
//                listHotTable();
//                tabIndex=1;
//                $('#userSearch input[name="user.hot"]').val(tabIndex);
//            });
//            $('#searchBtn').click(function(){
//                if(tabIndex==0){
//                    searchForm($('#userSearch'),'user',listGenTable);
//                }else if(tabIndex==1){
//                    searchForm($('#userSearch'),'user',listHotTable);
//                }
//
//            });
//            $('#clearBtn').click(function(){
//                if(tabIndex==0){
//                    clearSearchForm($('#userSearch'),listGenTable);
//                }else if(tabIndex==1){
//                    clearSearchForm($('#userSearch'),listHotTable);
//                }
//            });
        });

    });
</script>
</body>
</html>