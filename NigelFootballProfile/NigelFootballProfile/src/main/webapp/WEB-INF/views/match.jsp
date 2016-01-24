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
		Matches &nbsp;
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
	<div class="row" id="search" style="display: none;">
		<div class="col-lg-12">
			<div class="panel panel-info">
				<div class="panel panel-body">
					<form action="match" class="form-inline">

						<div class="form-group" id="frmSearch">
							<label for="team">Select championships</label>
							<div class="input-group ">
								<span class="input-group-addon"> <span
									class=" glyphicon glyphicon-search"></span>
								</span> <select id="srcChamp" class="form-control input-sm" type="text"
									name="srcChamp">
									<option value="All">All</option>
									<c:forEach items="${listChamp }" var="champ">
										<option value="${champ.champId}">${champ.fullName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<button type="submit" class="btn btn-info btn-sm"
							id="submitSearch">
							<span class="glyphicon glyphicon-search "></span> Search
						</button>

					</form>
				</div>

			</div>
		</div>

	</div>
	<c:if test="${champ.fullName != null  }">
		<div class="col-lg-8">
			<h4>
			<a href="toChampionship">
						<button type="button" class="btn btn-danger btn-sm" >
							<span class="glyphicon glyphicon-arrow-left"></span>
						</button></a>
				<img alt="${champ.fullName }" width="25px"
					src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;
				<a href="toAddMatch?champId=${champ.champId }">
			<button class="btn btn-success btn-sm" name="submit"
												type="button" value="Add">Add Match</button>
			</a>
				<h4>
				
		</div>
	</c:if>
	<div class="row">
		<div class="col-lg-12">
			<c:choose>
				<c:when test="${listMatch.size() == 0 || listMatch == null}">
					<div class="alert alert-danger" role="alert">
						No data
					</div>
				</c:when>
				<c:otherwise>
					<div class="row">
						<c:forEach var="match" items="${listMatch}" varStatus="no">

							<div class="col-lg-4">
								<div class="panel panel-primary">
									<div class="panel-body">
										<h5 align="center">
											<c:forEach var="matchT" items="${match.matchTeams }">

												<c:if test="${ matchT.side eq 'A' }">
													<b>${matchT.team.fullName}</b>
												</c:if>
											</c:forEach>
											&nbsp;:&nbsp;
											<c:forEach var="matchT" items="${match.matchTeams }">
												<c:if test="${ matchT.side eq 'B' }">

													<b>${matchT.team.fullName}</b>
												</c:if>

											</c:forEach>

										</h5>
										<center>
											<h4>
												<c:forEach var="matchT" items="${match.matchTeams }">

													<c:if test="${ matchT.side eq 'A' }">
														<img alt="${matchT.team.fullName }" width="25px"
															src="<c:url value="${matchT.team.logoUrl}" />" />
													</c:if>
												</c:forEach>
												<c:if test="${match.isPlayed() eq true }">
													<span class="label label-success label-lg">
														&nbsp;${match.goalA }&nbsp;:&nbsp;${match.goalB }&nbsp;</span>
												</c:if>
												<c:forEach var="matchT" items="${match.matchTeams }">
													<c:if test="${ matchT.side eq 'B' }">
														<img alt="${matchT.team.fullName }" width="25px"
															src="<c:url value="${matchT.team.logoUrl}" />" />

													</c:if>

												</c:forEach>
											</h4>
										</center>
										<i><fmt:formatDate value="${match.dateTime}"
												pattern="dd.MM.yyyy HH:mm" /></i> <br />
										<c:forEach var="it" items="${sessionScope.Items}">

											<c:if
												test="${ it.item eq match.round and it.language eq 'E' }">
												<i>${it.description }</i>
											</c:if>
										</c:forEach>
										<br /> ${match.championship.fullName } <br />
										${match.stadium.name}, ${match.stadium.city.name }
										<!-- Buttons here -->
										<br />
										<div class="btn-group btn-group-xs" role="group"
											aria-label="...">
											<button type="button" class="btn btn-primary btm-xs">Detail</button>
											<button type="button" class="btn btn-success btm-xs">Modify</button>
											<button type="button" class="btn btn-warning btm-xs">Result</button>
											<button type="button" class="btn btn-danger btm-xs">Live!</button>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
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