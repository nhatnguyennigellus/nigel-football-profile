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
					class="alert-link">Back to match list</a></strong>
			</div>
		</c:if>
		<div class="row">
			<c:if test="${champ.fullName != null  }">
				<div class="col-lg-8">
					<h4>
						<a href="match?srcChamp=${champ.champId }">
							<button type="button" class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-arrow-left"></span>
							</button>
						</a> <img alt="${champ.fullName }" width="25px"
							src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }
						<h4>
				</div>
			</c:if>
			<div class="col-md-6">
				<div class="panel panel-info">
					<div class="panel-body">
						<form action="addScorer" method="post" role="form"
							id="frmModifyScorerA">
							<input id="champId" class="form-control input-sm" name="champId"
								type="hidden" value="${champ.champId }" /> <input id="matchId"
								class="form-control input-sm" name="matchId" type="hidden"
								value="${match.matchId }" /> <input id="side"
								class="form-control input-sm" name="side" type="hidden"
								value="A" />

							<div class="row">
								<div class="form-group col-md-12">
									<h4>
										<c:forEach var="matchT" items="${match.matchTeams }">
											<c:if test="${ matchT.side eq 'A' }">
												<img alt="${matchT.team.fullName }" width="25px"
													src="<c:url value="${matchT.team.logoUrl}" />" /> ${matchT.team.fullName }</c:if>
										</c:forEach>
									</h4>
								</div>
								<div class="form-group col-md-6">
									<label class="control-label" for="teamA">Player</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span> <select id="playerA" class="form-control input-sm"
											name="playerA">
											<c:forEach items="${teamPlayerA }" var="teamP">
												<option value="${teamP.player.playerId }">
													${teamP.player.firstName }&nbsp;${teamP.player.lastName }</option>
											</c:forEach>
										</select>
										<select id="playerAB" class="form-control input-sm" style="display: none;"
											name="playerAB">
											<c:forEach items="${teamPlayerB }" var="teamP">
												<option value="${teamP.player.playerId }">
													${teamP.player.firstName }&nbsp;${teamP.player.lastName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label class="control-label" for="dateTime">Time</label> <input
										id="time" class="form-control input-sm" name="time" />
								</div>
								<div class="form-group col-md-2">
									<label class="control-label" for="addedTime">Added</label> <font
										color="red">* </font> <input id="addedTime"
										class="form-control input-sm" name="addedTime" value="0" />
								</div>
							</div>
							<div class="row">

								<div class="form-group col-md-3" >
									<input type="checkbox" name="og" data-size="small" id="ogA"
										data-label-width="auto" data-on-color="success"
										data-off-color="danger" data-on-text="Yes" data-off-text="No"
										data-label-text="OG" />
								</div>
								<div class="form-group col-md-3">
									<input type="checkbox" id="pen" name="pen" data-size="small"
										data-label-width="auto" data-on-color="success"
										data-off-color="danger" data-on-text="Yes" data-off-text="No"
										data-label-text="P" />
								</div>
								<div class="form-group col-md-3">

									<button type="submit" class="btn btn-success btn-sm">
										<span class="glyphicon glyphicon-check">&nbsp;</span> Submit
									</button>
								</div>
							</div>
						</form>
						<c:if test="${match.scorers.size() > 0 }">
							<table class="table table-hover" id="tableScorerA">
								<tbody>
									<c:forEach items="${match.scorers }" var="scorer">
										<tr>
											<c:if test="${scorer.team == 'A' }">
												<td>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
													${scorer.time }<c:if test="${scorer.addedTime != 0}">${scorer.addedTime}</c:if>'
													<c:if test="${scorer.isOwnGoal() eq true }">(OG)</c:if> <c:if
														test="${scorer.isPenalty() eq true }">(P)</c:if> &nbsp; <a
													href="removeScorer?scorerId=${scorer.id }"><button
															type="button" class="close" >

															<span aria-hidden="true">&times;</span>
														</button></a>
												</td>

											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>

				</div>
			</div>
			<div class="col-md-6">
				<div class="panel panel-info">
					<div class="panel-body">
						<form action="addScorer" method="post" role="form"
							id="frmModifyScorerB">
							<input id="champId" class="form-control input-sm" name="champId"
								type="hidden" value="${champ.champId }" /> <input id="matchId"
								class="form-control input-sm" name="matchId" type="hidden"
								value="${match.matchId }" /> <input id="side"
								class="form-control input-sm" name="side" type="hidden"
								value="B" />

							<div class="row">
								<div class="form-group col-md-12">
									<h4>
										<c:forEach var="matchT" items="${match.matchTeams }">
											<c:if test="${ matchT.side eq 'B' }">
												<img alt="${matchT.team.fullName }" width="25px"
													src="<c:url value="${matchT.team.logoUrl}" />" /> ${matchT.team.fullName }</c:if>
										</c:forEach>
									</h4>
								</div>
								<div class="form-group col-md-6">
									<label class="control-label" for="teamA">Player</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span> <select id="playerB" class="form-control input-sm"
											name="playerB">
											<c:forEach items="${teamPlayerB }" var="teamP">
												<option value="${teamP.player.playerId }">
													${teamP.player.firstName }&nbsp;${teamP.player.lastName }</option>
											</c:forEach>
										</select>
										<select id="playerBA" class="form-control input-sm" style="display: none;"
											name="playerBA">
											<c:forEach items="${teamPlayerA }" var="teamP">
												<option value="${teamP.player.playerId }">
													${teamP.player.firstName }&nbsp;${teamP.player.lastName }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label class="control-label" for="dateTime">Time</label> <input
										id="time" class="form-control input-sm" name="time" />
								</div>
								<div class="form-group col-md-2">

									<label class="control-label" for="addedTime">Added</label> <font
										color="red">* </font> <input id="addedTime"
										class="form-control input-sm" name="addedTime" value="0" />
								</div>
							</div>
							<div class="row">

								<div class="form-group col-md-3">
									<input type="checkbox" name="og" data-size="small" id="ogB" 
										data-label-width="auto" data-on-color="success"
										data-off-color="danger" data-on-text="Yes" data-off-text="No"
										data-label-text="OG" />
								</div>
								<div class="form-group col-md-3">
									<input type="checkbox" id="pen" name="pen" data-size="small"
										data-label-width="auto" data-on-color="success"
										data-off-color="danger" data-on-text="Yes" data-off-text="No"
										data-label-text="P" />
								</div>
								<div class="form-group col-md-3">
									<button type="submit" class="btn btn-success btn-sm">
										<span class="glyphicon glyphicon-check">&nbsp;</span> Submit
									</button>
								</div>
							</div>
						</form>
						<c:if test="${match.scorers.size() > 0 }">
							<table class="table table-hover" id="tableScorerA">
								<tbody>
									<c:forEach items="${match.scorers }" var="scorer">
										<c:if test="${scorer.team == 'B' }">
											<tr>
												<td>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
													${scorer.time }<c:if test="${scorer.addedTime != 0}">${scorer.addedTime}</c:if>'
													<c:if test="${scorer.isOwnGoal() eq true }">(OG)</c:if> <c:if
														test="${scorer.isPenalty() eq true }">(P)</c:if> &nbsp;
													<a
													href="removeScorer?scorerId=${scorer.id }"><button type="button" 
													class="close" >
														<span aria-hidden="true">&times;</span>
													</button></a>
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</c:if>
					</div>

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
	$('input[id="ogA"]').on('switchChange.bootstrapSwitch', function(event, state) {
		if(state) {
			$("#playerAB").show();
			$("#playerA").hide();
		}
		else {
			$("#playerA").show();
			$("#playerAB").hide();
		}
	});
	$('input[id="ogB"]').on('switchChange.bootstrapSwitch', function(event, state) {
		
		if(state) {
			$("#playerBA").show();
			$("#playerB").hide();
		}
		else {
			$("#playerB").show();
			$("#playerBA").hide();
		}
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