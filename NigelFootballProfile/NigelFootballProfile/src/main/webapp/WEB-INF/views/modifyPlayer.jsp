<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.css' /> ">
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap-datetimepicker.min.css' /> ">
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-info">
					<div class="panel-body">
						<form:form action="modifyPlayer" method="post" role="form"
							modelAttribute="player" id="frmModifyPlayer">
							<form:hidden id="playerId" class="form-control input-sm"
											 name="playerId" path="playerId" />
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
									<strong><a href="toPlayer" class="alert-link">Back
											to player list</a></strong>
								</div>
							</c:if>
							<div class="row">
								<div class="form-group col-md-3">
									<label class="control-label" for="lastName">Last name</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span>
										<form:input id="lastName" class="form-control input-sm"
											type="text" name="lastName" path="lastName" />
									</div>
								</div>

								<div class="form-group col-md-3">
									<label class="control-label" for="firstName">First name</label>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-user"></span>
										</span>
										<form:input id="firstName" class="form-control input-sm"
											type="text" name="firstName" path="firstName" />
									</div>
								</div>
								<div class="form-group col-md-3">
									<label class="control-label" for="birthdate">Date of
										birth </label>
									<div class="input-group date form_datetime col-md-12"
										data-date-format="dd.mm.yyyy" data-link-field="dtp_input1">
										<input class="form-control input-sm" size="16" type="text"
											value="<fmt:formatDate value='${player.birthdate}' pattern="dd.MM.yyyy" />" 
											readonly name="birthdate" id="birthdate"> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-calendar"></span></span>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-3">

									<label class="control-label" for="nationality">Nationality</label>
									<font color="red">* </font>
									<div class="input-group ">
										<select id="nationality" class="form-control input-sm"
											type="text" name="nationality" path="nationality"
											multiple="multiple" size="5">
											<c:forEach items="${countries }" var="country">
												<option value="${country.countryId }"
												<c:forEach items="${player.nationalities }" var="natl">
													<c:if test="${natl.countryId eq country.countryId }">
														selected 
													</c:if>
												</c:forEach>
													>${country.name }</option>
											</c:forEach>
										</select>
									</div>
								</div>

								<div class="form-group col-md-2">
									<label class="control-label" for="weight">Weight (kg)</label>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-modal-window"></span>
										</span>
										<form:input id="weight" class="form-control input-sm"
											type="text" name="weight" path="weight" />
									</div>
								</div>
								<div class="form-group col-md-2">
									<label class="control-label" for="height">Height (cm)</label>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-resize-vertical"></span>
										</span>
										<form:input class="form-control input-sm" type="text"
											id="height" name="height" path="height" />
									</div>
								</div>
								<div class="form-group col-md-3">

									<label class="control-label" for="position">Position</label> <font
										color="red">* </font>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-map-marker"></span>
										</span> <select id="position" class="form-control input-sm"
											name="position">
											<option value="GK"
												<c:if test="${player.position eq 'GK' }">
													selected
												</c:if>
											>Goalkeeper</option>
											<option value="DF"
											<c:if test="${player.position eq 'DF' }">
													selected
												</c:if>
												>Defender</option>
											<option value="MF"
											<c:if test="${player.position eq 'MF' }">
													selected
												</c:if>
												>Midfielder</option>
											<option value="FW"
											<c:if test="${player.position eq 'FW' }">
													selected
												</c:if>
												>Forward</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row"></div>
							<div class="form-group col-md-8">

								<button type="submit" class="btn btn-success">
									<span class="glyphicon glyphicon-check">&nbsp;</span> Submit
								</button>
								<button type="reset" class="btn btn-danger">
									<span class="glyphicon glyphicon-refresh">&nbsp;</span> Reset
								</button>
							</div>
					</div>

					</form:form>
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
		minView : 2,
		forceParse : 0,
		orientation : "auto",
	}).on('changeDate', function(ev) {
		$(this).datetimepicker('hide');
	});
	$(function() {
		$("#frmModifyPlayer").validate({
			rules : {
				lastName : {
					required : true,
				},
				birthdate : {
					required : true,
				},
				nationality : {
					required : true,
				}
			},
			messages : {
				lastName : {
					required : "Last name is required",
				},
				birthdate : {
					required : "Birthdate is required",
				},
				nationality : {
					required : "Please select one or more countries"
				}
			}
		})
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