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
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<h4>Work Log</h4>
				<c:choose>
					<c:when test="${listWorklog.size() == 0 || listWorklog == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableLog">
							<thead>
								<tr>
									<th>No</th>
									<th>Log Description</th>
									<th>Log Type</th>
									<th>Datetime</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="log" items="${listWorklog }" varStatus="no">
									<tr>
										<td>${no.count }</td>
										<td>${log.description }</td>
										<td>
										<h4>
										<span
											class="
									<c:if test="${log.logType == 'IMPT'}">label label-primary</c:if>
									<c:if test="${log.logType == 'ADDI'}">label label-success</c:if>
									<c:if test="${log.logType == 'SSCR'}">label label-danger</c:if>
									<c:if test="${log.logType == 'UPDT'}">label label-info</c:if>
									<c:if test="${log.logType == 'SQLR'}">label label-warning</c:if>
									">
											<c:if test="${log.logType == 'IMPT'}">Import</c:if>
									<c:if test="${log.logType == 'ADDI'}">Add</c:if>
									<c:if test="${log.logType == 'SSCR'}">Submit Scorer</c:if>
									<c:if test="${log.logType == 'UPDT'}">Update</c:if>
									<c:if test="${log.logType == 'SQLR'}">Submit Qualifiers</c:if></span>
									</h4>
										</td>
										<td>${log.datetime }</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>

				
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableLog').dataTable({
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