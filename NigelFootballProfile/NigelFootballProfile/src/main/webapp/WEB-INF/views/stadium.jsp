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
		Stadium <a href="#" data-toggle="modal" data-target="#modalAddStadium">
			<button type="submit" class="btn btn-success">
				<span class=" glyphicon glyphicon-plus"></span>
				Add
			</button>
		</a> <a href="#" data-toggle="modal" data-target="#modalImportStadium">
			<button type="submit" class="btn btn-info">
				<span class=" glyphicon glyphicon-save-file"></span>
				Import
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
	<c:if test="${sessionScope.success != null}">
		<div class="alert alert-success" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>${sessionScope.success }
		</div>
	</c:if>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-9">
				<c:choose>
					<c:when test="${listStadium.size() == 0 || listStadium == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableStadium">
							<thead>
								<tr>
									<th>No</th>
									<th>Name</th>
									<th>UEFA Name</th>
									<th>Capacity</th>
									<th>City</th>
									<th>Country</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="stadium" items="${listStadium }" varStatus="no">
									<tr>
										<td>${no.count }</td>
										<td>${stadium.name }</td>
										<td>${stadium.uefaName}</td>
										<td>${stadium.capacity}</td>
										<td>${stadium.city.name }</td>
										<td>${stadium.city.country.name }</td>
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyCountry"
											data-id="${stadium.id }" data-name="${stadium.name }"
											data-uefaname="${stadium.uefaName }" data-capacity="${stadium.capacity }"
											data-cityName="${country.city.name}" data-cityId="${country.city.id}"
											data-ctryName="${country.city.country.name}"  
											data-ctryShrtName="${country.city.country.shortName}"  
											id="updStad">
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

				<div class="modal fade" id="modalImportStadium" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">IMPORT STADIUM</h4>
							</div>

							<form method="POST" role="form" action="importStadium"
								id="frmImportStadium" enctype="multipart/form-data">
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
				
				<div class="modal fade" id="modalAddStadium" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">NEW STADIUM</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="addStadium"
										id="frmAddStadium" >
										
										<div class="form-group col-md-6">
										<label for="stdName">Name</label>
											<input id="stdName" class="form-control input-sm"
												name="stdName" />
										</div>
										<div class="form-group col-md-6">
											<label for="stdUefaName">UEFA Name</label> <input
												id="stdUefaName" class="form-control input-sm"
												name="stdUefaName" />
										</div>
										<div class="form-group col-md-4">
											<label for="stdCapacity">Capacity</label> <input
												id="stdCapacity" class="form-control input-sm"
												name="stdCapacity" />
										</div>
										<div class="form-group col-md-8">
											<label for="stdLocation">Location</label> <select
												id="stdLocation" class="form-control input-sm"
												name="stdLocation" >
												<c:forEach var="city" items="${listCity }">
													<option value="${city.id }">${city.name },&nbsp;${city.country.name.toUpperCase() }</option>
												</c:forEach>
												</select>
										</div><div class="form-group col-md-12">
										<input class="btn btn-success btn-sm" name="submit"
											type="submit" value="Add" />
											</div>
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
										<input class="btn btn-success btn-sm" name="submit"
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
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableStadium').dataTable({
			"pagingType" : "simple",
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 3, 6 ]
			} ]
		});
	});
	$(document).on("click", "#updCtry", function() {
		$("input#id").attr("value", $(this).data('id'));
		$("input#ctryName").attr("value", $(this).data('name'));
		$("input#shrtName").attr("value", $(this).data('shrtn'));
	});
	
	$(document).on("click", "#updCity", function() {
		$("input#cityId").attr("value", $(this).data('id'));
		$("input#cityName").attr("value", $(this).data('name'));
		$("span#ctryShrtName").html($(this).data('ctryshrtname'));
		$("input#cntryName").attr("value", $(this).data('ctryname'));
	});

	$(function() {
		$("#frmModifyCountry")
				.validate(
						{
							rules : {
								ctryName : {
									required : true,
								},
								shrtName : {
									required : true,
									exactlength : 3
								}
							},
							messages : {
								ctryName : {
									required : "Country Name is required!",
								},
								shrtName : {
									required : "Country Short Name is required!",
									rangelength : "Country Shortname must contain max 3 characters"
								}
							}
						});
		$("#frmModifyCity")
		.validate(
				{
					rules : {
						cityName : {
							required : true,
						},
						cntryName : {
							required : true,
						}
					},
					messages : {
						cityName : {
							required : "City Name is required!",
						},
						cntryName : {
							required : "Country Short Name is required!",
						}
					}
				});
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