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
	<h2>
		Player <a href="toAddPlayer">
			<button type="button" class="btn btn-success">
				<span class=" glyphicon glyphicon-plus"></span> Add
			</button>
		</a>&nbsp;
		<button type="button" class="btn btn-primary" id="showSearch">
			<span class=" glyphicon glyphicon-search"></span> Search
		</button>

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
		<div class="row" id="search" style="display: none;">
			<div class="col-lg-12">
				<div class="panel panel-info">
					<div class="panel panel-body">
						<form action="player" class="form-inline">

							<div class="form-group" id="frmSearch">
								<label for="team">Select team</label>
								<div class="input-group ">
									<span class="input-group-addon"> <span
										class=" glyphicon glyphicon-search"></span>
									</span> <select id="srcTeam" class="form-control input-sm" type="text"
										name="srcTeam">
										<option value="All">All</option>
										<c:forEach items="${listTeam }" var="team">
											<option value="${team.teamId}">${team.fullName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<button type="submit" class="btn btn-info btn-sm"
								id="submitSearch">
								<span class=" glyphicon glyphicon-search "></span> Search
							</button>



						</form>
					</div>

				</div>
			</div>

		</div>
		<c:if test="${teamName != null  }">
			<div class="col-lg-10">
				<h4>
					<img alt="${teamName }" width="25px"
						src="<c:url value="${logoUrl}" />" /> ${teamName }&nbsp;
					<h4>
			</div>
		</c:if>
		<div class="row">
			<div class="col-lg-10">
				<c:choose>
					<c:when test="${listPlayer.size() == 0 || listPlayer == null}">
						<div class="alert alert-danger" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>No data</div>
					</c:when>
					<c:otherwise>
						<table class="table table-hover" id="tablePlayer">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Position</th>
									<th>Birthdate</th>
									<th>Club</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="player" items="${listPlayer }" varStatus="no">
									<tr>
										<td>${no.count }</td>
										<td>${player.firstName}</td>
										<td>${player.lastName}</td>
										<td><h4>
												<span
													class="
													<c:if test="${player.position == 'GK' }">
											label label-warning label-lg
										</c:if>
													<c:if test="${player.position == 'DF' }">
											label label-success label-lg
										</c:if>
													<c:if test="${player.position == 'MF' }">
											label label-primary label-lg
										</c:if>
													<c:if test="${player.position == 'FW' }">
											label label-danger label-lg
										</c:if>
											">
													<c:if test="${player.position == 'GK' }">
											Goalkeeper
										</c:if> <c:if test="${player.position == 'DF' }">
											Defender
										</c:if> <c:if test="${player.position == 'MF' }">
											Midfielder
										</c:if> <c:if test="${player.position == 'FW' }">
											Forward
										</c:if>
												</span>
											</h4></td>
										<td><fmt:formatDate value="${player.birthdate}"
												pattern="dd.MM.yyyy" /></td>
										<td><c:forEach var="teamPl"
												items="${player.teamplayers }">
												<c:if
													test="${teamPl.team.teamType == 'TCLUB' and teamPl.status == true}">
													${teamPl.team.fullName}
												</c:if>
											</c:forEach> <c:if
												test="${teamName != null and captain == player.playerId}">
												<span class="badge">C</span>
											</c:if></td>

										<td><c:url var="urlUpd" value="toUpdatePlayer">
												<c:param name="id" value="${player.playerId}" />
											</c:url> <c:url var="urlTeam" value="toTeamPlayer">
												<c:param name="pId" value="${player.playerId}" />
											</c:url> <a href="${urlUpd }">
												<button type="button" class="btn btn-primary btn-sm">
													<span class="glyphicon glyphicon-pencil"></span>
												</button>
										</a> <a href="${urlTeam }">
												<button type="button" class="btn btn-success btn-sm">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
										</a> <a href="#" data-toggle="modal" data-target="#modalDetail"
											data-firstname="${player.firstName}"
											data-lastname="${player.lastName}"
											data-birthdate="<fmt:formatDate value="${player.birthdate}"
												pattern="dd.MM.yyyy" />"
											data-position="${player.position}"
											data-weight="${player.weight}" data-height="${player.height}"
											<c:forEach var="teamP" items="${player.teamplayers }">
												<c:if test="${teamP.team.teamType == 'TCLUB' and teamP.status == true}">
													data-club="${teamP.team.fullName}" data-clubkit="${teamP.kitNumber}"
												</c:if>
												<c:if test="${teamP.team.teamType == 'TNATL' and teamP.status == true}">
													data-natl="${teamP.team.fullName}" data-natlkit="${teamP.kitNumber}" 
												</c:if>
											</c:forEach>
											data-nationality="<c:forEach var="teamN" items="${player.nationalities }">
												${teamN.name}
												</c:forEach>"
											id="dtlPlayer">
												<button type="button" class="btn btn-warning btn-sm">
													<span class="glyphicon glyphicon-barcode"></span>
												</button>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>


				<div class="modal fade" id="modalDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">PLAYER BIO</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<dl class="dl-horizontal">
										<dt>Name</dt>
										<dd id="name"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Birthdate</dt>
										<dd id="birthdate"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Nationality</dt>
										<dd id="nationality"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Position</dt>
										<dd id="position"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Weight</dt>
										<dd id="weight"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Height</dt>
										<dd id="height"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>Club</dt>
										<dd id="club"></dd>
									</dl>
									<dl class="dl-horizontal">
										<dt>National Team</dt>
										<dd id="natl"></dd>
									</dl>
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