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
		<div class="row" id="search">
			<div class="col-lg-10">
				<div class="panel panel-info">
					<div class="panel panel-body">
						<form action="addTeamPlayer">
							<div class="row">
								<input type="hidden" id="playerId" name="playerId"
									value="${player.playerId }" />
								<div class="form-group col-md-6">
									<h4>${player.firstName }&nbsp;${player.lastName }</h4>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6">
									<label for="team">Club</label>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-list"></span>
										</span> <select id="club" class="form-control input-sm" type="text"
											name="club">
											<option value="No"></option>
											<c:forEach items="${listClub }" var="club">
												<option value="${club.teamId}" <c:forEach items="${player.teamplayers }" var="teamC">
														<c:if test="${teamC.team.teamId eq club.teamId }">
														selected
														</c:if>
													</c:forEach>
												>${club.fullName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label for="clubKit">Kit No</label>
									<div class="input-group ">
										<span class="input-group-addon"> # </span> <input id="clubKit"
											class="form-control input-sm" type="text" name="clubKit" 
											<c:forEach items="${player.teamplayers }" var="teamC">
														<c:if test="${teamC.team.teamType eq 'TCLUB' }">
														value="${teamC.kitNumber }"
														</c:if>
													</c:forEach>
												/>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label for="clubCap">Captain?</label> <input type="checkbox"
										id="clubCap" name="clubCap" data-size="small"
										data-label-width="30" data-on-color="success"
										data-off-color="danger"
										<c:forEach items="${player.teamplayers }" var="teamC">
											<c:if test="${teamC.team.teamType eq 'TCLUB' and teamC.isCaptain() eq true}">
												checked
											</c:if>
										</c:forEach> />
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6">
									<label for="team">National Team</label>
									<div class="input-group ">
										<span class="input-group-addon"> <span
											class=" glyphicon glyphicon-search"></span>
										</span> <select id="natl" class="form-control input-sm" type="text"
											name="natl">
											<option value="No"></option>
											<c:forEach items="${listNational }" var="natl">
												<option value="${natl.teamId}"
													<c:forEach items="${player.teamplayers }" var="teamN">
														<c:if test="${teamN.team.teamId eq natl.teamId }">
														selected
														</c:if>
													</c:forEach>
												>${natl.fullName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label for="natlKit">Kit No</label>
									<div class="input-group ">
										<span class="input-group-addon"> # </span> <input id="natlKit"
											class="form-control input-sm" type="text" name="natlKit" 
											<c:forEach items="${player.teamplayers }" var="teamN">
														<c:if test="${teamN.team.teamType eq 'TNATL' }">
														value="${teamN.kitNumber }"
														</c:if>
													</c:forEach>/>
									</div>
								</div>
								<div class="form-group col-md-2">
									<label for="natlCap">Captain?</label> <input type="checkbox"
										id="natlCap" name="natlCap" data-size="small"
										data-label-width="30" data-on-color="success"
										data-off-color="danger" <c:forEach items="${player.teamplayers }" var="teamN">
											<c:if test="${teamN.team.teamType eq 'TNATL' and teamN.isCaptain() eq true}">
												checked
											</c:if>
										</c:forEach> />
								</div>
							</div>
							<button type="submit" class="btn btn-success btn-sm" id="submitTeam">
								<span class=" glyphicon glyphicon-ok "></span> Submit Team
							</button>
							<a href="javascript:history.go(-1);"><button type="button" class="btn btn-danger btn-sm" id="">
								<span class=" glyphicon glyphicon-remove "></span> Cancel
							</button></a>

						</form>
					</div>

				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-lg-10">
				<c:choose>
					<c:when
						test="${player.teamplayers.size() == 0 || player.teamplayers == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-hover" id="tablePlayer">
							<thead>
								<tr>
									<th>Team</th>
									<th>Captain?</th>
									<th>Kit Number</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="team" items="${player.teamplayers }"
									varStatus="no">
									<tr>
										<td>${team.team.fullName}</td>
										<td>
											<h4>
												<span
													<c:if test="${team.isCaptain() == true}">
												 class="label label-success label-lg">
												Yes
											</c:if>
													<c:if test="${team.isCaptain() == false}">
											 class="label label-danger label-lg">
											No
											</c:if></span>
											</h4>
										</td>
										<td>${team.kitNumber} </td>
										<td></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>


				
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
	});
	$(document)
			.on(
					"click",
					"#dtlPlayer",
					function() {
						/* var name = ; */
						$("dd#name").html(
								$(this).data('firstname') + " "
										+ $(this).data('lastname'));
						$("dd#birthdate").html($(this).data("birthdate"));

						if ($(this).data('position') == "GK") {
							$("dd#position")
									.html(
											'<h5><span class="label label-warning label-lg">Goalkeeper</span></h5>');
						} else if ($(this).data('position') == "DF") {
							$("dd#position")
									.html(
											'<h5><span class="label label-success label-lg">Defender</span></h5>');
						} else if ($(this).data('position') == "MF") {
							$("dd#position")
									.html(
											'<h5><span class="label label-primary label-lg">Midfielder</span></h5>');
						} else if ($(this).data('position') == "FW") {
							$("dd#position")
									.html(
											'<h5><span class="label label-danger label-lg">Forward</span></h5>');
						}

						$("dd#weight").html($(this).data('weight') + " kg");
						$("dd#height").html($(this).data('height') + " cm");
						$("dd#nationality").html($(this).data('nationality'));
						if ($(this).data('club') != null)
							$("dd#club").html(
									$(this).data('club') + " - " + "#<b>"
											+ $(this).data('clubkit') + "</b>");
						if ($(this).data('natl') != null)
							$("dd#natl").html(
									$(this).data('natl') + " - " + "#<b>"
											+ $(this).data('natlkit')
											+ "</b><br>");

					});

	$(document).on("click", "#showSearch", function() {
		$("#search").fadeIn();
		$("#showSearch").hide();
	});
</script>
</html>