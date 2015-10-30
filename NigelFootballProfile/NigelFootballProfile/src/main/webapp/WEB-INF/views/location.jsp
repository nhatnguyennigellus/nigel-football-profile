<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Location
	<a href="#" data-toggle="modal" data-target="#modalCountry">
		<button type="submit" class="btn btn-success">
			<span class=" glyphicon glyphicon-globe"></span>
		</button>
	</a>
	<a href="#" data-toggle="modal" data-target="#modalCity">
		<button type="submit" class="btn btn-info">
			<span class=" glyphicon glyphicon-map-marker"></span>
		</button>
	</a></h2>
	<c:if test="${sessionScope.txtError != null}">
		<div class="alert alert-danger" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>${sessionScope.txtError }</div>
	</c:if>
	<c:if test="${sessionScope.importSuccess != null}">
		<div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>${sessionScope.importSuccess }
		</div>
	</c:if>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6">
				<h4>Country</h4>
				<c:choose>
					<c:when test="${listCountry.size() == 0 || listCountry == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableCountry">
							<thead>
								<tr>
									<th>Country</th>
									<th>Short name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="country" items="${listCountry }">
									<tr>
										<td>${country.name }</td>
										<td>${country.shortName }</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm">
												<span class="glyphicon glyphicon-edit"></span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>

				<div class="modal fade" id="modalCountry" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">IMPORT COUNTRY</h4>
							</div>

							<form method="POST" role="form" action="importCountry"
								id="frmImportCountry" enctype="multipart/form-data">
								<div class="modal-body">

									<dl class="dl-horizontal form-group">
										<dt>File Import:</dt>
										<dd>
											<input type="file" id="fileUpload" name="file">
										</dd>
									</dl>

								</div>
								<div class="modal-footer">
									<input class="btn btn-success btn-sm" type="submit"
										value="Upload">
									<button type="button" class="btn btn-danger btn-sm"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<h4>City</h4>
				<c:choose>
					<c:when test="${listCity.size() == 0 || listCity == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableCity">
							<thead>
								<tr>
									<th>City</th>
									<th>Country</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="city" items="${listCity }">
									<tr>
										<td>${city.name }</td>
										<td>${city.country.name }</td>
										<td>
											<button type="button" class="btn btn-primary btn-sm">
												<span class="glyphicon glyphicon-edit"></span>
											</button>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>

				<div class="modal fade" id="modalCity" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">IMPORT CITY</h4>
							</div>
							<form method="POST" role="form" action="importCity"
									id="frmImportCity" enctype="multipart/form-data">
							<div class="modal-body">
									<dl class="dl-horizontal form-group">
										<dt>File Import:</dt>
										<dd>
											<input type="file" id="fileUpload" name="fileCity">
										</dd>
									</dl>
								
							</div>
							<div class="modal-footer">
								<input class="btn btn-success btn-sm" type="submit"
									value="Upload">
								<button type="button" class="btn btn-danger btn-sm"
									data-dismiss="modal">Close</button>
							</div></form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <div class="container-fluid">
		<h1>Dashboard</h1>
		<div class="row">
			<ol class="breadcrumb">
				<li><i class="glyphicon glyphicon-home"></i> Dashboard</li>
			</ol>
			<div class="col-lg-3">
				<div class="panel panel-red">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-user fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${CustomerNo }</div>
								<div>country</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="viewCustomer"> <span class="pull-left">View
								country</span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
					<sec:authorize access="hasRole('Support')">
						<div class="panel-body">
							<a href="toAddCustomer"> <span class="pull-left">Add
									country</span> <span class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
							</span></a>
						</div>
					</sec:authorize>
				</div>
			</div>

			<div class="col-lg-3">
				<div class="panel panel-green">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-book fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${AccountNo }</div>
								<div>Account</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="searchAccount"> <span class="pull-left">View
								Accounts</span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>

				</div>
			</div>

			<div class="col-lg-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-3">
								<i class="glyphicon glyphicon-briefcase fa-4x"></i>
							</div>
							<div class="col-xs-9 text-right">
								<div class="huge">${TransactionNo }</div>
								<div>Transaction</div>
							</div>
						</div>
					</div>

					<div class="panel-body">
						<a href="searchTransaction"> <span class="pull-left">Search
								Transaction </span> <span class="pull-right"> <i
								class="glyphicon glyphicon-circle-arrow-right"></i>
						</span></a>
					</div>
					<sec:authorize access="hasRole('Support')">
						<div class="panel-body">
							<a href="accountTransaction"> <span class="pull-left">Perform
									Transaction </span> <span class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
							</span></a>
						</div>
					</sec:authorize>
				</div>
			</div>
			<sec:authorize access="hasRole('Admin')">
				<div class="col-lg-3" >
					<div class="panel panel-yellow">
						<div class="panel-heading" style="height: 89px;">
							<div class="row">
								<div class="col-xs-3">
									<i class="glyphicon glyphicon-usd fa-4x"></i>
								</div>
								<div class="col-xs-9 text-right">
									<div><h4>INTEREST RATE</h4>
									</div>
								</div>
							</div>
						</div>

						<div class="panel-body">
							<a href="viewInterestRate"> <span class="pull-left">View
									Interest Rate</span> <span class="pull-right"> <i
									class="glyphicon glyphicon-circle-arrow-right"></i>
							</span></a>
						</div>

					</div>
				</div>
			</sec:authorize>
		</div>
	</div> --%>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableCountry').dataTable({
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 1, 2 ]
		} ]
		});
		$('#tableCity').dataTable({
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 1, 2 ]
		} ]
		});
	});
	$(window).load(function() {
		$('#myModal').modal('show');
	});
</script>
</html>