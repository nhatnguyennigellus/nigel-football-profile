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
	<h2>Participant</h2>
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
		<c:if test="${champ != null  }">
			<div class="col-lg-10">
				<h4>
					
					<form method="POST" role="form" action="addParticipant"
						class="form-inline" id="frmAddParti">
						<img alt="${champ.fullName }" width="25px"
						src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;
						<input id="champId" class="form-control input-sm" name="champId"
							type="hidden" value="${champ.champId }" />
						<div class="form-group">
							<select id="partTeam" class="form-control input-sm"
								name="partTeam">
								<c:forEach var="team" items="${listTeam}">
									<option value="${team.teamId }">${team.fullName}</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-success btn-sm" id="addPart"
							name="addPart">
							<span class="glyphicon glyphicon-plus"></span> Add
						</button>
					</form>
					</a>
					<h4>
			</div>
		</c:if>
		<div class="row">
			<div class="col-lg-9">
				<c:choose>
					<c:when test="${listPtcp.size() == 0 || listPtcp == null}">
						<div class="alert alert-danger" role="alert">No data</div>
					</c:when>
					<c:otherwise>
						<table class="table table-striped" id="tableParti">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>Team</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="part" items="${listPtcp }" varStatus="no">
									<tr>
										<td><img alt="${part.team.fullName }" width="25px"
											src="<c:url value="${part.team.logoUrl}" />" /></td>
										<td>${part.team.fullName }</td>
										<td><c:forEach var="it" items="${listItem }">
												<c:if
													test="${ it.item eq part.statuz and it.language eq 'E' }">
												${it.description }
												</c:if>
											</c:forEach></td>
										<td><c:url var="updParti" value="${part.stateId }"></c:url>
											<a href="toUpdateParti" id="updStad">
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
				<div class="modal fade" id="modalAddPart" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">NEW PARTICIPANT</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="addParticipant"
										id="frmAddParti">
										<input id="champId" class="form-control input-sm"
											name="champId" type="text" />
										<div class="form-group col-md-6">
											<label for="stdTeam">Team</label> <select id="partTeam"
												class="form-control input-sm" name="partTeam">
												<c:forEach var="team" items="${listTeam}">
													<option value="${team.teamId }">${team.fullName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="stdTeam">Championship</label>
											<div class="input-group input-group-sm">
												<input type="text" class="form-control" id="champName"
													name="champName" aria-describedby="basic-addon2"
													readonly="readonly"> <span
													class="input-group-addon" id="champShrtName"
													name="champShrtName"></span>
											</div>

										</div>
										<div class="form-group col-md-12">
											<button class="btn btn-success btn-sm" name="submit"
												type="submit" value="Add">Add</button>
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
		$('#tableParti').dataTable({
			"pagingType" : "simple",
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0 ]
			} ]
		});
	});

	$(document).on("click", "#addPart", function() {
		$("input#champId").attr("value", $(this).data('champid'));
		$("input#champName").attr("value", $(this).data('name'));
		$("span#champShrtName").html($(this).data('shortname'));

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