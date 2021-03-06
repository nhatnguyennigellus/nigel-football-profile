<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="shortcut icon"
	href="<c:url value='/resources/images/logo.png'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery-ui.css'/> ">

<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css'/> ">

<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.css'/> ">

<link rel="stylesheet"
	href="<c:url value='/resources/css/jquery.dataTables.css' />">
<link rel="stylesheet"
	href="<c:url value='/resources/css/dataTables.bootstrap.css' />">

<link rel="stylesheet"
	href="<c:url value='/resources/css/sb-admin.css'/> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/> ">

<link rel="stylesheet"
	href="<c:url value='/resources/dist/css/bootstrap3/bootstrap-switch.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/docs/css/highlight.css'/> ">
<link rel="stylesheet"
	href="<c:url value='/resources/docs/css/main.css'/> ">
<link rel="stylesheet"
	href="<c:url value='http://getbootstrap.com/assets/css/docs.min.css'/> ">

<style>
#footer {
	background: #1878C6;
	width: 100%;
	height: 30px;
	position: fixed;
	bottom: 0;
	left: 0;
	text-align: center;
	z-index: 1;
	vertical-align: middle;
	padding-top: 4px;
}
</style>

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-ui.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.10.2.min.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.dataTables.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/dataTables.bootstrap.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery.validate.js' /> "></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/additional-methods.js' /> "></script>
<script type="text/javascript"
	src="<c:url value='/resources/docs/js/highlight.js' /> "></script>
<script type="text/javascript"
	src="<c:url value='/resources/dist/js/bootstrap-switch.js' /> "></script>
<script type="text/javascript"
	src="<c:url value='/resources/docs/js/main.js' /> "></script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="home"> <img
			src='<c:url value="/resources/images/logo.png" />' height="45" alt="" />
		</a>
	</div>
	<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li><a href="#">NIGEL'S FOOTBALL PROFILE</a></li>
			<li><a href="home"><i class="glyphicon glyphicon-home"></i>
					&nbsp;Home</a></li>

			<li><a href="javascript:;" data-toggle="dropdown"
				class="dropdown-toggle"><i class="glyphicon glyphicon-play"></i>
					&nbsp;Be-In-Game&nbsp;<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="glyphicon glyphicon-refresh"></i>
							Draw Simulation</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-sound-5-1"></i>
							Manual Livescore</a></li>
					
				</ul></li>
			<li class="dropdown"><a href="javascript:;"
				data-toggle="dropdown" class="dropdown-toggle"><i
					class="glyphicon glyphicon-duplicate"></i> &nbsp;Data &nbsp;<b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="#"><i class="glyphicon glyphicon-list-alt"></i>
							Standings</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-king"></i>
							Top scorer</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-hourglass"></i>
							History</a></li>

				</ul></li>
			<li><a href="about"><i class="glyphicon glyphicon-info-sign"></i>&nbsp;About</a></li>
			<li><a href="admin"><i class="glyphicon glyphicon-briefcase"></i>&nbsp;System Page</a></li>
			<!-- <li class="dropdown"><a href="javascript:;"
				data-toggle="dropdown" class="dropdown-toggle"><i
					class="glyphicon glyphicon-user"></i> &nbsp;System &nbsp;<b
					class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="toLocation"><i
							class="glyphicon glyphicon-map-marker"></i> Location</a></li>
					<li><a href="toStadium"><i
							class="glyphicon glyphicon-road"></i> Stadium</a></li>
					<li><a href="toTeam"><i
							class="glyphicon glyphicon-th-list"></i> Team</a></li>
					<li><a href="toPlayer"><i class="glyphicon glyphicon-user"></i>
							Player</a></li>
					<li><a href="#"><i class="glyphicon glyphicon-calendar"></i>
							Match Schedule</a></li>
					<li><a href="toChampionship"><i
							class="glyphicon glyphicon-star-empty"></i> Championship</a></li>
					<li><a href="worklog"><i class="glyphicon glyphicon-edit"></i>
							Work Log</a></li>
				</ul></li> -->
		</ul>
		<ul class="nav navbar-right navbar-nav">

			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <font size="2"><tiles:insertAttribute
							name="title" /></font> <i class="glyphicon glyphicon-file"></i>&nbsp;&nbsp;
			</a></li>
		</ul>
	</div>

	<div id="page-heading"></div>

	<!-- /.navbar-collapse --> </nav>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->

</body>
</html>