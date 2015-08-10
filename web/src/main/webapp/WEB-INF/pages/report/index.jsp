<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.context.SecurityContext" %>
<%@ page import="org.springframework.security.web.context.HttpSessionSecurityContextRepository" %>
<%--
  Created by IntelliJ IDEA.
  User: lihao1
  Date: 7/29/15
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%
    Object o = request.getSession().getAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY);
    if(o!=null){
        SecurityContext securityContext = SecurityContextHolder.getContext();
        request.setAttribute("userinfo",securityContext.getAuthentication().getPrincipal());
    }
%>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ include file="/common/common.jsp" %>
    <script src="<c:url value="/resources/lib/jplugin/dataTables.bootstrap.js"/>"></script>
    <script src="<c:url value="/resources/lib/jplugin/jquery.dataTables.js"/>"></script>
    <title>大数据中心</title>
    <style type="text/css">
        a:link {
            text-decoration: none;
        }
        a:visited {
            text-decoration: none;
        }
        a:hover {
            text-decoration: none;
        }
        a:active {
            text-decoration: none;
        }
        body{
            font-size: 13px;
        }
        .breadcrumb{
            margin-bottom:10px;
        }
    </style>

</head>
<body style="padding-top: 75px;">

<div class="container">
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#header-navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h1 id="site-name"><a style="cursor: default;" href="#">成都智慧会展大数据中心</a></h1>
                </div>
                <div id="header-navbar-collapse" class="navbar-collapse collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" style="cursor: hand;" data-toggle="dropdown">欢迎， <strong>${userinfo.username}</strong> <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#changePasswordModel" data-toggle="modal" data-target="#changePasswordModel">修改密码</a></li>
                                <li><a href="#logoutModel" data-toggle="modal" data-target="#logoutModel">安全退出</a></li>
                            </ul>
                        </li>
                        <li class="divider-vertical"></li>
                        <li class="dropdown" id="recent-actions-module">
                            <a  class="dropdown-toggle" data-toggle="dropdown">最近动作 <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li class="changelink">
                                    <a href="#">
                                    <i class="glyphicon glyphicon-edit"></i>
                                    未来一周好戏连台 三大会展活动相继在蓉举行:正在运行
                                    <span class="mini quiet">(项目)</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <ul class="breadcrumb">
                <li><a href="./index.html">首页</a></li>
            </ul>
        </div>
    </div>

    <div class="row" style="margin-bottom: 3px">
        <div class="col-sm-3" style="padding-right:0 ">
            <select name="action" class="form-control" >
                <option value="delete_selected">单个项目报告</option>
                <option value="delete_selected">对比项目报告</option>
            </select>
        </div>
        <div class="col-sm-2" style="padding-left: 2px">
            <button type="submit" class="btn btn-default" title="" name="index" value="0" data-original-title="运行选中的动作">执行</button>
        </div>
    </div>
    <div >
        <div>
            <table class="table table-striped table-bordered" id="dataTables">
                <thead>
                <tr>
                    <th width="37">
                        <span>
                            <input type="checkbox" id="action-toggle" style="display: inline-block;">
                        </span>
                    </th>
                    <th width="281">
                        项目名称
                    </th>
                    <th width="235">
                        关键字
                    </th>
                    <th width="82">
                        评估类型
                    </th>
                    <th width="83">
                        评估状态
                    </th>
                    <th width="152">
                        评估截止时间
                    </th>
                    <th width="146">
                        项目创建时间
                    </th>
                    <th width="60px">
                        评估结果
                    </th>
                </tr>
                </thead>
                <tbody>
                    <tr>

                        <td ><input class="action-select" name="_selected_action" type="checkbox" value="8"></td>

                        <th >新常态再出发 成都会展业力争新作为</th>

                        <td >新常态|成都|会展|新作为</td>

                        <td >媒体评估</td>

                        <td >正在运行</td>

                        <td >2015-03-21 12:12:12</td>

                        <td >2015-03-21 12:12:12</td>
                        <td ><a href="./ueditor/edit_result.html" target="_blank"><i class="fa fa-eye fa-lg"></i></a></td>
                    </tr>
                </tbody>
            </table>

            <div class="table-bottom">
                <div id="hotHallTablePager" class="paging"></div>
            </div>
        </div>
    </div>
</div>
<div id="changePasswordModel" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog width-35">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="gridSystemModalLabel"><i class="icon-cog"></i>修改密码</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <form class="form-horizontal" id="updatePwdForm">
                        <div class="form-group">
                            <label for="inputPassword" class="control-label">新密码:</label>
                            <div>
                                <input type="password" class="form-control" data-validate="password" id="inputPassword" placeholder="新密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPasswordHit" class="control-label">确认密码:</label>
                            <div>
                                <input type="password" class="form-control" data-validate="passwordHit" data-hit="inputPassword" id="inputPasswordHit" placeholder="确认密码">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="changePasswordBtn" class="btn btn-primary" onclick="changeAdminPassword()">确定</button>
                <button type="button" class="btn" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div id="logoutModel" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog width-35">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title"><i class="icon-power-off"></i>退出系统</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <h4>你确定要退出系统?</h4>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="logout();">退出</button>
                <button type="button" class="btn" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#dataTables').dataTable({
        sPaginationType:'full_numbers'
    })


    $('#changePasswordModel').on('show.bs.modal', function (event) {
        clearForm($('#updatePwdForm'));
    });
    function changeAdminPassword(){
        if(!checkForm($('#updatePwdForm'))){
            return;
        }
        var val=$('#inputPassword').val();

        $('#changePasswordModel').modal('hide');
        var result=requestStringData('html/user/security/changeAdminPwd',{password:val});
        if(result.success){
            alertSuccess('操作成功');
        }else{
            alertError(result.message);
        }
    }
    function logout(){
        window.location.replace(appPath+'logout.jsp?plat=security');
    }
</script>


</body>
</html>
