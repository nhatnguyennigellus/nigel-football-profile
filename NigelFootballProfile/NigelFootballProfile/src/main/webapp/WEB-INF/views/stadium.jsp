<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		Stadium <a href="#" data-toggle="modal" data-target="#modalAddStadium">
			<button type="submit" class="btn btn-success">
				<span class=" glyphicon glyphicon-plus"></span> Add
			</button>
		</a> <a href="#" data-toggle="modal" data-target="#modalImportStadium">
			<button type="submit" class="btn btn-info">
				<span class=" glyphicon glyphicon-save-file"></span> Import
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
						<div class="alert alert-danger" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>No data</div>
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
											data-target="#modalModifyStadium"
											data-id="${stadium.stadiumId }" data-name="${stadium.name }"
											data-uefaname="${stadium.uefaName }"
											data-capacity="${stadium.capacity }"
											data-city="${stadium.city.cityId}" id="updStad">
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

									<form:form method="POST" role="form" action="addStadium"
										id="frmAddStadium" modelAttribute="stadium">

										<div class="form-group col-md-6">
											<label for="stdName">Name</label>
											<form:input id="stdName" class="form-control input-sm"
												name="stdName" path="name" />
										</div>
										<div class="form-group col-md-6">
											<label for="stdUefaName">UEFA Name</label>
											<form:input id="stdUefaName" class="form-control input-sm"
												name="stdUefaName" path="uefaName" />
										</div>
										<div class="form-group col-md-4">
											<label for="stdCapacity">Capacity</label>
											<form:input id="stdCapacity" class="form-control input-sm"
												name="stdCapacity" path="capacity" />
										</div>
										<div class="form-group col-md-8">
											<label for="stdLocation">Location</label> <select
												id="stdLocation" class="form-control input-sm"
												name="stdLocation">
												<c:forEach var="city" items="${listCity }">
													<option value="${city.cityId }">${city.name },&nbsp;${city.country.name.toUpperCase() }</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-12">
											<button class="btn btn-success btn-sm" name="submit"
												type="submit" value="Add">Add</button>
										</div>
									</form:form>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger btn-sm"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="modalModifyStadium" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">MODIFY STADIUM</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyStadium"
										id="frmModifyStadium">
										<input id="stdId" class="form-control input-sm" name="stdId"
											type="hidden" />
										<div class="form-group col-md-6">
											<label for="stdName">Name</label> <input id="stdName"
												class="form-control input-sm" name="stdName" />
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
												name="stdLocation">
												<c:forEach var="city" items="${listCity }">
													<option id="stdCity${city.cityId }" value="${city.cityId }">
														${city.name },&nbsp;${city.country.name.toUpperCase() }</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-12">
											<input class="btn btn-success btn-sm" name="submit"
												type="submit" value="Update" />
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

	$(document).on(
			"click",
			"#updStad",
			function() {
				$("input#stdId").attr("value", $(this).data('id'));
				$("input#stdName").attr("value", $(this).data('name'));
				$("input#stdUefaName").attr("value", $(this).data('uefaname'));
				$("input#stdCapacity").attr("value", $(this).data('capacity'));
				if ($(this).data('city') == $(
						"option#stdCity" + $(this).data('city')).val()) {
					$("option#stdCity" + $(this).data('city')).attr("selected",
							"selected");
				}
				$("input#cityId").attr("value", $(this).data('id'));

			});

	$(function() {
		$("#frmAddStadium").validate({
			rules : {
				name : {
					required : true,
				},
				uefaName : {
					required : true,
				},
				capacity : {
					required : true,
					number : true,
					minStrict : 0
				}
			},
			messages : {
				name : {
					required : "Stadium Name is required!",
				},
				uefaName : {
					required : "Stadium UEFA Name is required!",
				},
				capacity : {
					required : "Capacity is required!",
					number : "Capacity must be a number!",
					minStrict : "Capacity must be above zero!"
				}
			}
		});
		$("#frmModifyStadium").validate({
			rules : {
				stdName : {
					required : true,
				},
				stdUefaName : {
					required : true,
				},
				stdCapacity : {
					required : true,
					number : true,
					minStrict : 0
				}
			},
			messages : {
				stdName : {
					required : "Stadium Name is required!",
				},
				stdUefaName : {
					required : "Stadium UEFA Name is required!",
				},
				stdCapacity : {
					required : "Capacity is required!",
					number : "Capacity must be a number!",
					minStrict : "Capacity must be above zero!"
				}
			}
		});
	});

	$.validator.addMethod("exactlength", function(value, element, param) {
		return this.optional(element) || value.length == param;
	}, jQuery.format("Please enter exactly {0} characters."));

	$.validator.addMethod('minStrict', function(value, el, param) {
		return value >= param;
	});

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