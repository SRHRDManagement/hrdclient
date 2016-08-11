<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KSHRD Home</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School System MGR</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/images/favicon_1.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/plugins/morris/morris.css">
    <link href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/static/css/core.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/static/css/components.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/static/css/pages.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/static/css/responsive.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/static/css/icons.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/resources/static/js/modernizr.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/angular.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath}/resources/static/plugins/sweetalert/dist/sweetalert.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css" rel="stylesheet">
</head>
<body class="fixed-left">
	<!-- === wrapper of header and left menu AND all content === -->
    <div id="wrapper">
        <!-- ==== header ====-->
        <div class="topbar">
            <div class="topbar-left">
                <div class="text-center">
                    <a href="index.html" class="logo"><i class="icon-magnet icon-c-logo"></i><span>School system</span></a>
                </div>
            </div>
            <div class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="">
                        <div class="pull-left">
                            <button class="button-menu-mobile open-left">
                                <i class="ion-navicon"></i>
                            </button>
                            <span class="clearfix"></span>
                        </div>

                        <form role="search" class="navbar-left app-search pull-left hidden-xs">
                            <input type="text" style="background-color: white; color: black" placeholder="Search..." class="form-control">
                            <a href="#"><i class="fa fa-search"></i></a>
                        </form>

                        <ul class="nav navbar-nav navbar-right pull-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle profile" data-toggle="dropdown" aria-expanded="true"><img src="assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> </a>
                                <ul class="dropdown-menu">
                                    <li><a href="javascript:void(0)"><i class="ti-user m-r-5"></i> Profile</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-settings m-r-5"></i> Settings</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-lock m-r-5"></i> Lock screen</a></li>
                                    <li><a href="javascript:void(0)"><i class="ti-power-off m-r-5"></i> Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- ==== end header ====-->
        <!-- ========== menu ========== -->
        <div class="left side-menu">
            <div class="sidebar-inner slimscrollleft">
                <div id="sidebar-menu">
                    <ul>
                        <!--<li class="text-muted menu-title">Navigation</li>-->
                        <li>
                            <a href="${pageContext.request.contextPath}/home/index" class="waves-effect"><i class="ti-home"></i> <span> Dashboard </span> </a>
                        </li>
                        <li class="has_sub">
                            <a href="#" class="waves-effect"><i class="ti-pencil-alt"></i><span>Study Management</span></a>
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/generation/index"><i class="fa fa-institution"></i>Generation</a></li>
                                <li><a class="active" href="${pageContext.request.contextPath}/course/index"><i class="fa fa-mortar-board "></i>Course</a></li>
                                <li><a href="${pageContext.request.contextPath}/class/index"><i class="fa fa-sitemap"></i>Class</a></li>
                                <li><a href="${pageContext.request.contextPath}/subject/index"><i class="fa fa-trophy"></i>Subject</a></li>

                            </ul>
                        </li>
                        <li class="has_sub">
                            <a href="#" class="waves-effect"><i class="fa fa-graduation-cap"></i> <span> Student </span> </a>
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/student/register"><i class="fa fa-plus-square"></i>Register</a></li>
                                <li><a href="${pageContext.request.contextPath}/student/index"><i class="fa fa-list-alt"></i>Student List</a></li>
                            </ul>
                        </li>
                        <li class="has_sub">
                            <a href="#" class="waves-effect"><i class="md  md-people"></i><span> Instructor </span> </a>
                            <ul class="list-unstyled">
                                <li><a href="components-grid.html"><i class="fa fa-plus-circle"></i>New Instructor</a></li>
                                <li><a href="components-widgets.html"><i class="fa fa-bars"></i>Instructor List</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="user.html" class="waves-effect"><i class="fa fa-user"></i> <span> User </span> </a>
                        </li><hr>
                        <li><a href="ui-portlets.html" class="waves-effect"><i class="fa fa-check-square-o"></i><span> Attendance </span></a></li>
                        <li><a href="score.html" class="waves-effect"><i class="fa fa-adn"></i><span> Score </span></a></li>
                    </ul>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- ========== end menu ========== -->
