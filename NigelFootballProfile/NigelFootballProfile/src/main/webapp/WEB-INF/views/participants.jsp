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
	<h3>Participant</h3>
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
						<a href="toChampionship">
						<button type="button" class="btn btn-danger btn-sm" >
							<span class="glyphicon glyphicon-arrow-left"></span>
						</button></a>
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
						<div class="form-group "><input type="checkbox"
										id="addStd" name="addStd" data-size="small"
										data-label-width="auto" data-on-color="success"
										data-off-color="danger" data-on-text="Yes" data-off-text="No"
										data-label-text="Add Stadium"
										 />
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
			<div class="col-lg-10">
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
									<c:if test="${listPtcp.get(0).team.teamType eq 'TCLUB' }">
									<th>Stadium</th>
									<th>City</th>
									<th>Country</th>
									</c:if>
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
										<c:if test="${part.team.teamType eq 'TCLUB' }">
										<td>
										${part.team.stadium.name}
										</td>
										<td>
										${part.team.stadium.city.name}
										</td>
										<td>
										${part.team.stadium.city.country.name}
										</td>
										</c:if>
										<td><c:forEach var="it" items="${listItem }">
												<c:if
													test="${ it.item eq part.statuz and it.language eq 'E' }">
												${it.description }
												</c:if>
											</c:forEach></td>
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyPart"
											data-stateid="${part.stateId }"
											data-champid="${part.championship.champId }"
											data-champname="${part.championship.fullName }"
											data-team="${part.team.fullName}"
											data-statuz="${part.statuz }" id="updState">
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
				<div class="modal fade" id="modalModifyPart" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">MODIFY STATE</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyState"
										id="frmAddParti">
										<input id="stateId" class="form-control input-sm"
											name="stateId" type="hidden" />
										<input id="champId" class="form-control input-sm"
											name="champId" type="hidden" />
										<div class="form-group col-md-6">
											<label for="partTeam">Team</label> <input id="partTeam"
												class="form-control input-sm" name="partTeam" 
												 readonly="readonly">
												
											</select>
										</div>
										<div class="form-group col-md-6">
											<label for="stdTeam">Championship</label> <input type="text"
												class="form-control input-sm" id="champName" name="champName"
												aria-describedby="basic-addon2" readonly="readonly">

										</div>
										<div class="form-group col-md-6">
											<label for="stdTeam">Status</label> <select id="statuz"
												class="form-control input-sm" name="statuz">
												<c:forEach var="it" items="${listItem}">
													<option id="partStt${it.item }" value="${it.item }">
													${it.description}</option>
												</c:forEach>
											</select>
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

	$(document).on("click", "#updState", function() {
		$("input#stateId").attr("value", $(this).data('stateid'));
		$("input#champId").attr("value", $(this).data('champid'));
		$("input#champName").attr("value", $(this).data('champname'));
		$("input#partTeam").attr("value", $(this).data('team'));
		if ($(this).data('statuz') == $(
				"option#partStt" + $(this).data('statuz')).val()) {
			$("option#partStt" + $(this).data('statuz')).attr(
					"selected", "selected");
		}
	});

	$(function() {
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