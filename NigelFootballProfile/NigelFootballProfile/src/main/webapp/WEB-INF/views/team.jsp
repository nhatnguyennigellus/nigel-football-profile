<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>
		Team <a href="#" data-toggle="modal" data-target="#modalAddTeam">
			<button type="submit" class="btn btn-success">
				<span class=" glyphicon glyphicon-plus"></span> Add
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
			<div class="col-lg-12">
				<c:choose>
					<c:when test="${listTeam.size() == 0 || listTeam == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableTeam">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>Name</th>
									<th>Short Name</th>
									<th>Coach</th>
									<th>Stadium</th>
									<th>City</th>
									<th>Country</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="team" items="${listTeam }" varStatus="no">
									<tr
										<c:if test="${team.teamType == 'TCLUB' }">
											class="warning"
										</c:if>
										<c:if test="${team.teamType == 'TNATL' }">
											class="info"
										</c:if>>
										<td><img alt="${team.fullName }" width="25px"
											src="<c:url value="${team.logoUrl}" />" /></td>
										<td>${team.fullName}</td>
										<td>${team.shortName}</td>
										<td>${team.coach}</td>
										<td>${team.stadium.name}</td>
										<td>${team.stadium.city.name }</td>
										<td>${team.stadium.city.country.name }</td>
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyTeam" data-id="${team.teamId }"
											data-fullname="${team.fullName }" data-coach="${team.coach }"
											data-type="${team.teamType }"
											data-shortname="${team.shortName }"
											data-stadium="${team.stadium.stadiumId}" id="updTeam">
												<button type="button" class="btn btn-primary btn-sm">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
										</a> <a href="#" data-toggle="modal" data-target="#modalLogo"
											data-id="${team.teamId }" id="updLogo">
												<button type="button" class="btn btn-warning btn-sm">
													<span class="glyphicon glyphicon-bookmark"></span>
												</button>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>

				<div class="modal fade" id="modalLogo" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">ADD LOGO/FLAG</h4>
							</div>

							<form method="POST" role="form" action="uploadLogo"
								id="frmUploadLogo" enctype="multipart/form-data">
								<div class="modal-body">
									<input type="hidden" id="tmId" name="tmId" />
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

				<div class="modal fade" id="modalAddTeam" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">NEW TEAM</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form:form method="POST" role="form" action="addTeam"
										id="frmAddTeam" modelAttribute="team">

										<div class="form-group col-md-6">
											<label for="tmName">Name</label>
											<form:input id="tmName" class="form-control input-sm"
												name="tmName" path="fullName" />
										</div>
										<div class="form-group col-md-3">
											<label for="tmShrtName">Short Name</label>
											<form:input id="tmShrtName" class="form-control input-sm"
												name="tmShrtName" path="shortName" />
										</div>

										<div class="form-group col-md-6">
											<label for="tmCoach">Coach</label>
											<form:input id="tmCoach" class="form-control input-sm"
												name="tmCoach" path="coach" />
										</div>
										<div class="form-group col-md-4">
											<label for="teamType">Type</label> <input type="checkbox"
												id="teamType" name="teamType" data-size="small"
												data-label-width="40" data-on-text="Club"
												data-off-text="National" data-on-color="warning"
												data-off-color="info" />
										</div>

										<div class="form-group col-md-8">
											<label for="tmStadium">Stadium</label> <select id="tmStadium"
												class="form-control input-sm" name="tmStadium">
												<c:forEach var="stadium" items="${listStadium }">
													<option value="${stadium.stadiumId }">${stadium.name },&nbsp;${stadium.city.name},&nbsp;${stadium.city.country.name.toUpperCase() }</option>
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

				<div class="modal fade" id="modalModifyTeam" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">MODIFY TEAM</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyTeam"
										id="frmModifyTeam">
										<input id="tmId" class="form-control input-sm" name="tmId"
											type="hidden" />
										<div class="form-group col-md-6">
											<label for="tmName">Name</label> <input id="tmName"
												class="form-control input-sm" name="tmName" />
										</div>
										<div class="form-group col-md-3">
											<label for="tmShrtName">Short Name</label> <input
												id="tmShrtName" class="form-control input-sm"
												name="tmShrtName" />
										</div>

										<div class="form-group col-md-6">
											<label for="tmCoach">Coach</label> <input id="tmCoach"
												class="form-control input-sm" name="tmCoach" />
										</div>
										<div class="form-group col-md-4">
											<label for="tmType"> Type
												</label> 
											<input type="button" class="btn btn-danger btn-sm" id="tmType" 
												name="tmType" value="" />
												<input type="hidden" class="btn btn-danger btn-sm" id="tmTypeUpd" 
												name="tmTypeUpd" value="" />
										</div>
										<div class="form-group col-md-8">
											<label for="tmStadium">Stadium</label> <select id="tmStadium"
												class="form-control input-sm" name="tmStadium">
												<c:forEach var="stadium" items="${listStadium }">
													<option id="tmStd${stadium.stadiumId }"
														value="${stadium.stadiumId }">${stadium.name },&nbsp;${stadium.city.name},&nbsp;${stadium.city.country.name.toUpperCase() }</option>
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
	$("[name='teamType']").bootstrapSwitch();

	$(document).ready(function() {
		$('#tableTeam').dataTable({
			"pagingType" : "simple",
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 7 ]
			} ]
		});
		
	});
	$(document).on(
			"click",
			"#tmType",
			function() {
				if ($("input#tmType").attr("value") == 'Club') {
					$("input#tmType").attr("value", "National");
					$("input#tmTypeUpd").attr("value", "TNATL");
					$("input#tmType").attr("class", "btn btn-info btn-sm");
				} else {
					$("input#tmType").attr("value", "Club");
					$("input#tmTypeUpd").attr("value", "TCLUB");
					$("input#tmType").attr("class", "btn btn-warning btn-sm");
				}
			});
	$(document).on(
			"click",
			"#updTeam",
			function() {
				$("input#tmId").attr("value", $(this).data('id'));
				$("input#tmName").attr("value", $(this).data('fullname'));
				$("input#tmShrtName").attr("value", $(this).data('shortname'));
				$("input#tmCoach").attr("value", $(this).data('coach'));
				if ($(this).data('stadium') == $(
						"option#tmStd" + $(this).data('stadium')).val()) {
					$("option#tmStd" + $(this).data('stadium')).attr(
							"selected", "selected");
				}
				
				
				if ($(this).data('type') == "TCLUB") {
					$("input#tmType").attr("value", "Club");
					$("input#tmTypeUpd").attr("value", "TCLUB");
					$("input#tmType").attr("class", "btn btn-warning btn-sm");
				}
				else if ($(this).data('type') == "TNATL") {
					$("input#tmType").attr("value", "National");
					$("input#tmTypeUpd").attr("value", "TNATL");
					$("input#tmType").attr("class", "btn btn-info btn-sm");
				} 

				$("input#stadiumId").attr("value", $(this).data('stadium'));

			});
	$(document).on("click", "#updLogo", function() {
		$("input#tmId").attr("value", $(this).data('id'));

	});

	$(function() {
		$("#frmAddTeam").validate({
			rules : {
				fullName : {
					required : true,
				},
				shortName : {
					required : true,
					exactlength : 3
				},
				coach : {
					required : true,
				}
			},
			messages : {
				fullName : {
					required : "Team Name is required!",
				},
				shortName : {
					required : "Short Name is required!",
					exactlength : "Short Name must contain 3 characters!"
				},
				coach : {
					required : "Coach is required!",
				}
			}
		});
		$("#frmModifyTeam").validate({
			rules : {
				tmName : {
					required : true,
				},
				tmShrtName : {
					required : true,
					exactlength : 3
				},
				tmCoach : {
					required : true,
				}
			},
			messages : {
				tmName : {
					required : "Team Name is required!",
				},
				tmShrtName : {
					required : "Short Name is required!",
					exactlength : "Short Name must contain 3 characters!"
				},
				tmCoach : {
					required : "Coach is required!",
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