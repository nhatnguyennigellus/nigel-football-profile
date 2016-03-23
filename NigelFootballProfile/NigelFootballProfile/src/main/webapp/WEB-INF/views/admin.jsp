<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<h1>Dashboard</h1>
		<div class="row">
			<div class="col-lg-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-globe fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${CountryNo }</div>
								<div>Country</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="toLocation"> <span class="pull-left">View
								Location</span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-road fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${StadeNo }</div>
								<div>Stadium</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="toStadium"> <span class="pull-left">View
								Stadiums</span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>

				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-info">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-map-marker fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${CityNo }</div>
								<div>City</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="toLocation"> <span class="pull-left">View
								Location</span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
				</div>
			</div>
			
			

			<div class="col-lg-3">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-th-list fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${TeamNo }</div>
								<div>Team</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="toTeam"> <span class="pull-left">View Team </span> 
						<span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
				</div>
			</div>
			<div class="col-lg-3">
				<div class="panel panel-yellow">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-user fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${PlayerNo }</div>
								<div>Player</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="toPlayer"> <span class="pull-left">View Players </span> 
						<span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
				</div>
			</div>
				<div class="col-lg-3" >
					<div class="panel panel-red">
						<div class="panel-heading" style="height: 89px;">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-glass fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${ChampNo }</div>
								<div>Championship</div>
								</div>
							</div>
						</div>

						<div class="panel-body">
							<a href="toChampionship"> <span class="pull-left">View
									Championship</span> <span class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
							</span></a>
						</div>

					</div>
				</div>
				<div class="col-lg-3" >
					<div class="panel panel-light-green">
						<div class="panel-heading" style="height: 89px;">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-calendar fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${Items }</div>
									<div>Item</div>
								</div>
							</div>
						</div>

						<div class="panel-body">
							<a href="toItem"> <span class="pull-left">View
									Items</span> <span class="pull-right"> <i
									class="glyphicon glyphicon-info-sign"></i>
							</span></a>
						</div>

					</div>
				</div>
				<div class="col-lg-3" >
					<div class="panel panel-purple">
						<div class="panel-heading" style="height: 89px;">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-edit fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div class="huge">${LogNo }</div>
									<div>Log</div>
								</div>
							</div>
						</div>

						<div class="panel-body">
							<a href="worklog"> <span class="pull-left">View
									Work Log</span> <span class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
							</span></a>
						</div>

					</div>
				</div>
		</div>
	</div>
</body>
</html>