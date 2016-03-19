<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${champ.fullName != null  }">
		<div class="row">
			<div class="col-lg-8">
				<h3>
					<a href="standing?srcChamp=${champ.champId }">
						<button type="button" class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-arrow-left"></span>
						</button>
					</a> <img alt="${champ.fullName }" width="25px"
						src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;

				</h3>
			</div>
		</div>
	</c:if>

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


	<div class="row">
		<div class="col-lg-3">
			<c:if test="${A != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group A <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">
							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="A" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${A }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${B != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group B <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="B" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${B }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${C != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group C <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="C" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${C }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${D != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group D <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="D" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${D }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3">
			<c:if test="${E != null }">
				<!-- Group E -->
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group E <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="E" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${E }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${F != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group F <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="F" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${F }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${G != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group G <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="G" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${G }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
		<div class="col-lg-3">
			<c:if test="${H != null }">
				<form method="POST" role="form" action="updateGroup"
					id="frmGroupMtn">
					<div class="panel panel-info">
						<div class="panel panel-heading">
							Group H <input class="btn btn-warning btn-xs"
								style="float: right" name="submit" type="submit" value="Submit">

							</a>
						</div>
						<div class="panel panel-body">
							<input id="groupId" class="form-control input-sm" name="groupId"
								value="H" type="hidden" /> <input id="champId"
								class="form-control input-sm" name="champId"
								value="${champ.champId }" type="hidden" />
							<c:forEach begin="1" end="${champ.teamsPerGroup }" varStatus="no">
								<div class="form-group col-md-12">
									<select id="team${ no.count}" class="form-control input-sm"
										name="team${ no.count}">
										<option value="">---</option>
										<c:forEach items="${parti }" var="part">
											<option id="${part.team.teamId}"
												<c:forEach var="standing" items="${H }" varStatus="rank">
										<c:if test="${part.team.teamId eq standing.team.teamId and rank.count == no.count}">selected</c:if>	
										</c:forEach>
												value="${part.team.teamId }">${part.team.fullName }</option>
										</c:forEach>
									</select>
								</div>
							</c:forEach>

						</div>
					</div>
				</form>
			</c:if>
		</div>
	</div>
	</div>
	
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tablePlayer').dataTable({
			"pagingType" : "simple",
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 2 ]
			} ]
		});
		
		$('form').each(function() {
			$(this).validate({
				rules : {
					team1 : {
						required : true
						
					},
					team2 : {
						required : true
						
					},
					team3 : {
						required : true
						
					},
					team4 : {
						required : true
						
					}
				},
				messages : {
					team1 : {
						required : ""
						
					},
					team2 : {
						required : ""
						
					},
					team3 : {
						required : ""
						
					},
					team4 : {
						required : ""
						
					}
				}
			});
		});
	});
	$(document).on(
			"click",
			"#btnGroup",
			function() {
				$("input#groupId").attr("value", $(this).data('group'));
				$("input#champId").attr("value", $(this).data('champid'));

				var partNo = $(this).data('partino');
				alert($(this).data(partNo));
				for (var i = 1; i <= partNo; i++) {

					if ($(this).data('team' + i) == $(
							"option#" + $(this).data('team' + i)).attr("id")) {
						$("option#" + $(this).data('team' + i)).attr(
								"selected", "selected");
					}
				}

			});

	

	$.validator.addMethod('minStrict', function(value, el, param) {
		return value >= param;
	});
	$(document).on("click", "#showSearch", function() {
		$("#search").fadeIn();
		$("#showSearch").hide();
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