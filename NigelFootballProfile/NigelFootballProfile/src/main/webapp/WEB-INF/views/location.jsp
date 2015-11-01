<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<h2>
		Location <a href="#" data-toggle="modal" data-target="#modalCountry">
			<button type="submit" class="btn btn-success">
				<span class=" glyphicon glyphicon-globe"></span>
			</button>
		</a> <a href="#" data-toggle="modal" data-target="#modalCity">
			<button type="submit" class="btn btn-info">
				<span class=" glyphicon glyphicon-map-marker"></span>
			</button>
		</a>
	</h2>
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
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyCountry"
											data-id="${country.countryId }" data-name="${country.name }"
											data-shrtn="${country.shortName }" id="updCtry">
												<button type="button" class="btn btn-primary btn-sm">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
										</a></td>
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
				<div class="modal fade" id="modalModifyCountry" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">MODIFY COUNTRY</h4>
							</div>



							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyCountry"
										id="frmModifyCountry" class="form-inline">
										<input id="id" class="form-control input-sm" name="ctryId"
											type="hidden" />
										<div class="form-group">
											<input id="ctryName" class="form-control input-sm"
												name="ctryName" />
										</div>
										<div class="form-group">
											<input id="shrtName" name="shrtName"
												class="form-control input-sm" />
										</div>
										<input class="btn btn-success btn-xs" name="submit"
											type="submit" value="Update" />
									</form>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger btn-sm"
									data-dismiss="modal">Close</button>
							</div>
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
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	$(document).on("click", "#updCtry", function() {
		$("input#id").attr("value", $(this).data('id'));
		$("input#ctryName").attr("value", $(this).data('name'));
		$("input#shrtName").attr("value", $(this).data('shrtn'));
	});
	
	$(function () {
		$("#frmModifyCountry").validate({
			rules : {
				ctryName: {
					required: true,
				},
				shrtName: {
					required: true,
					exactlength: 3
				}
			},
			messages: {
				ctryName: {
					required: "Country Name is required!",
				},
				shrtName: {
					required: "Country Short Name is required!",
					rangelength: "Country Shortname must contain max 3 characters"
				}
			}
		})
	});
	
	$.validator.addMethod("exactlength", function(value, element, param) {
		return this.optional(element) || value.length == param;
	}, jQuery.format("Please enter exactly {0} characters."));

	$.validator.setDefaults({
		highlight : function(element) {
			$(element).closest('.form-group').addClass('has-error');
		},
		unhighlight : function(element) {
			$(element).closest('.form-group').removeClass('has-error');
		},
		errorElement : 'span',
		errorClass : 'help-block',
		errorPlacement : function(error, element) {
			if (element.parent('.input-group').length) {
				error.insertAfter(element.parent());
			} else {
				error.insertAfter(element);
			}
		}
	});
</script>
</html>