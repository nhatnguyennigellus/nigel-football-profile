<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.css' /> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.min.css' /> ">
</head>
<body>
	<p />
	<div class="container-fluid">
		<c:if test="${champ != null  }">
			<div class="col-lg-10">
				<h4>

					<form method="POST" role="form" action="addParticipant"
						class="form-inline" id="frmAddParti">
						<a href="match?srcChamp=${champ.champId }">
							<button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-arrow-left"></span>
							</button>
						</a> <img alt="${champ.fullName }" width="25px"
							src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;
						<input id="champId" class="form-control input-sm" name="champId"
							type="hidden" value="${champ.champId }" />

					</form>
					<h4>
			</div>
		</c:if>
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-body">
						<form action="modifyMatch" method="post" role="form"
							id="frmModifyMatch">
							<input id="champId" class="form-control input-sm" name="champId"
								type="hidden" value="${champ.champId }" /> <input id="matchId"
								class="form-control input-sm" name="matchId" type="hidden"
								value="${match.matchId }" />
							<c:if test="${txtError != null }">

								<div class="alert alert-danger" role="alert">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>${txtError }</div>
							</c:if>
							<c:if test="${success != null }">

								<div class="alert alert-success" role="alert">
									<button type="button" class="close" data-dismiss="alert"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>${success }
									<strong><a href="match?srcChamp=${champ.champId }"
										class="alert-link">Back to Match List</a></strong> or 
										<strong><a href="standing?srcChamp=${champ.champId }"
										class="alert-link">Back to Fixture</a></strong>
								</div>
							</c:if>
							<div class="row">
								<div class="form-group col-md-4">
									<label class="control-label" for="teamA">Team A</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span> <select id="teamA" class="form-control input-sm" name="teamA">
											<c:forEach items="${listTeam }" var="team">
												<option value="${team.teamId }"
													<c:if test="${team.teamId eq teamA.team.teamId }">
														selected
													</c:if>>${team.fullName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-4">
									<label class="control-label" for="teamB">Team B</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span> <select id="teamB" class="form-control input-sm" name="teamB">
											<c:forEach items="${listTeam }" var="team">
												<option value="${team.teamId }"
													<c:if test="${team.teamId eq teamB.team.teamId }">
														selected
													</c:if>>${team.fullName }</option>
											</c:forEach>
										</select>
									</div>
								</div>


							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label class="control-label" for="dateTime">Datetime</label>
									<div class="input-group date form_datetime col-md-12"
										data-date-format="dd.mm.yyyy hh:ii:00"
										data-link-field="dtp_input1">
										<input class="form-control input-sm" size="16" type="text"
											readonly name="dateTime" id="dateTime"
											value="<fmt:formatDate value='${match.dateTime }' pattern='dd.MM.yyyy HH:mm:00' />">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>
								<div class="form-group col-md-4">

									<label class="control-label" for="stadium">Venue</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-map-marker"></span>
										</span><select id="stadium" class="form-control input-sm" type="text"
											name="stadium">
											<c:forEach var="stadium" items="${listStadium }">
												<option value="${stadium.stadiumId }"
													<c:if test="${match.stadium.stadiumId eq stadium.stadiumId }">
												selected
												</c:if>>
													${stadium.name },&nbsp;${stadium.city.name},&nbsp;${stadium.city.country.name.toUpperCase() }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-3">

									<label class="control-label" for="round">Round</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-hourglass"></span>
										</span> <select id="round" class="form-control input-sm" type="text"
											name="round">
											<c:forEach var="it" items="${listItem}">
												<option value="${it.item }"
													<c:if test="${match.round eq it.item }">
												selected
												</c:if>>${it.description}</option>
											</c:forEach>
										</select>
									</div>
								</div>

							</div>
							<div class="row"></div>
							<div class="form-group col-md-8">

								<button type="submit" class="btn btn-success">
									<span class="glyphicon glyphicon-check">&nbsp;</span> Submit
								</button>
							</div>
					</div>

					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>

<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap-datetimepicker.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/resources/js/bootstrap-datetimepicker.min.js' />"></script>
<script type="text/javascript">
	$('.form_datetime').datetimepicker({
		pickDate : false,
		weekStart : 1,
		todayHighlight : 1,
		startView : 2,
		startDate : '-1m',
		forceParse : 0,
		orientation : "auto",
	}).on('changeDate', function(ev) {
		$(this).datetimepicker('hide');
	});

	$(function() {
		$("#frmModifyMatch").validate({
			rules : {
				dateTime : {
					required : true,
				},
			},
			messages : {
				dateTime : {
					required : "Datetime is required",
				},
			}
		})
	});

	$.validator.addMethod('minStrict', function(value, el, param) {
		return (value >= param && value != null) || value == null;
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