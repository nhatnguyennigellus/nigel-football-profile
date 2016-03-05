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
					<button type="button" class="btn btn-danger btn-sm">
						<span class="glyphicon glyphicon-arrow-left"></span>
					</button>
				</a> <img alt="${champ.fullName }" width="25px"
					src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;
				<a href="toAddMatch?champId=${champ.champId }">
					<button class="btn btn-success btn-sm" name="submit" type="button"
						value="Add">Add Match</button>
				</a>
				<h4>
		</div>
	</c:if>
	<div class="row">
		<div class="col-lg-12">
			<c:choose>
				<c:when test="${listMatch.size() == 0 || listMatch == null}">
					<div class="alert alert-danger" role="alert">No data</div>
				</c:when>
				<c:otherwise>
					<table class="table table-hover" id="tableParti">

						<tbody>
							<c:forEach var="match" items="${listMatch}">
								<tr class="active">
									<td><i><fmt:formatDate value="${match.dateTime}"
												pattern="dd.MM.yyyy HH:mm" /></i></td>
									<td><b> <c:forEach var="matchT"
												items="${match.matchTeams }">
												<c:if test="${ matchT.side eq 'A' }">
													<img alt="${matchT.team.fullName }" width="25px"
														src="<c:url value="${matchT.team.logoUrl}" />" />
												</c:if>
											</c:forEach> <c:forEach var="matchT" items="${match.matchTeams }">
												<c:if test="${ matchT.side eq 'A' }">
													<b>${matchT.team.fullName}</b>
												</c:if>
											</c:forEach>
									</b></td>
									<td>
										<button id="btnDetail" type="button"
											class="
												<c:if test="${match.isPlayed() eq true }">btn btn-success btn-xs</c:if>
												<c:if test="${match.isPlayed() eq false }">btn btn-default btn-xs</c:if>">
											<a href="#" data-toggle="modal"
												style="text-decoration: none;"
												data-target="#modalUpdateScore" data-id="${match.matchId }"
												data-champid="${match.championship.champId }"
												data-goala="${match.goalA }" data-goalb="${match.goalB }"
												<c:forEach var="matchT" items="${match.matchTeams }">
														<c:if test="${ matchT.side eq 'A' }">
															data-teama="${matchT.team.fullName }"
														</c:if>
													</c:forEach>
												<c:forEach var="matchT" items="${match.matchTeams }">
														<c:if test="${ matchT.side eq 'B' }">
															data-teamb="${matchT.team.fullName }"
														</c:if>
													</c:forEach>
												id="btnDetail"> <c:if
													test="${match.isPlayed() eq true }">
													<font color="white"
														style="font-size: small; font-weight: bold;">&nbsp;${match.goalA }&nbsp;:&nbsp;${match.goalB }&nbsp;</font>
												</c:if> <c:if test="${match.isPlayed() eq false }">
													<font color="black"
														style="font-size: small; font-weight: bold;">&nbsp;&nbsp;-&nbsp;:&nbsp;-&nbsp;&nbsp;</font>
												</c:if>
											</a>
										</button>
									</td>
									<td><b> <c:forEach var="matchT"
												items="${match.matchTeams }">
												<c:if test="${ matchT.side eq 'B' }">
													<b>${matchT.team.fullName}</b>
												</c:if>

											</c:forEach> <c:forEach var="matchT" items="${match.matchTeams }">
												<c:if test="${ matchT.side eq 'B' }">
													<img alt="${matchT.team.fullName }" width="25px"
														align="right"
														src="<c:url value="${matchT.team.logoUrl}" />" />
												</c:if>

											</c:forEach>
									</b></td>

									<td>${match.stadium.name},&nbsp;${match.stadium.city.name }</td>
									<td><c:forEach var="it" items="${sessionScope.Items}">

											<c:if
												test="${ it.item eq match.round and it.language eq 'E' }">
												<i>${it.description }</i>
											</c:if>
										</c:forEach></td>
									<td>
										<div class="btn-group btn-group-xs" role="group"
											aria-label="...">
											<c:url var="modify" value="toModifyMatch">
												<c:param name="matchId" value="${match.matchId }"></c:param>
												<c:param name="champId"
													value="${match.championship.champId}"></c:param>
											</c:url>
											
											<c:url var="lnkScorer" value="toScorer">
												<c:param name="matchId" value="${match.matchId }"></c:param>
												<c:param name="champId"
													value="${match.championship.champId}"></c:param>
											</c:url>
											<button type="button"
												class="btn btn-primary btn-xs dropdown-toggle"
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">Detail</button>
											<c:if test="${match.scorers.size() > 0 }">
												<ul class="dropdown-menu">
													<li><a><b><c:forEach var="matchT"
																	items="${match.matchTeams }">
																	<c:if test="${ matchT.side eq 'A' }">${matchT.team.fullName }</c:if>
																</c:forEach> </b></a></li>
													<c:forEach items="${match.scorers }" var="scorer">
														<c:if test="${scorer.team == 'A' and scorer.isStatus() eq true}">
															<li><a>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
																	${scorer.time }<c:if test="${scorer.addedTime != 0}">+${scorer.addedTime}</c:if>'
																	<c:if test="${scorer.isOwnGoal() eq true }">(OG)</c:if>
																	<c:if test="${scorer.isPenalty() eq true }">(P)</c:if>
																	&nbsp;
															</a></li>
														</c:if>
													</c:forEach>
													<li role="separator" class="divider"></li>
													<li><a><b><c:forEach var="matchT"
																	items="${match.matchTeams }">
																	<c:if test="${ matchT.side eq 'B' }">${matchT.team.fullName }</c:if>
																</c:forEach> </b></a></li>
													<c:forEach items="${match.scorers }" var="scorer">
														<c:if test="${scorer.team == 'B' and scorer.isStatus() eq true }">
															<li><a>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
																	${scorer.time }<c:if test="${scorer.addedTime != 0}">${scorer.addedTime}</c:if>'
																	<c:if test="${scorer.isOwnGoal() eq true }">(OG)</c:if>
																	<c:if test="${scorer.isPenalty() eq true }">(P)</c:if>
																	&nbsp;
															</a></li>
														</c:if>
													</c:forEach>
												</ul>
											</c:if>
											<div class="btn-group" role="group">
												<button type="button"
													class="btn btn-warning btn-xs dropdown-toggle"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">Modify</button>
												<ul class="dropdown-menu">
													<li><a href="${modify }">Info</a></li>
													<c:if test="${match.isPlayed() eq true }"><li><a href="${lnkScorer }">Scorer</a></li></c:if>
												</ul>
											</div>
											<button type="button" class="btn btn-danger btm-xs">Live!</button>
										</div>
										<div class="modal fade" id="modalUpdateScore" tabindex="-1"
											role="dialog" aria-labelledby="myModalLabel"
											aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">
															<span aria-hidden="true">&times;</span><span
																class="sr-only">Close</span>
														</button>
														<h4 class="modal-title" id="myModalLabel">UPDATE
															SCORE</h4>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-md-12">
																<form method="POST" role="form" action="updateScore"
																	id="frmUpdateScore">

																	<input id="matchId" class="form-control input-sm"
																		name="matchId" type="hidden" /> <input id="champId"
																		class="form-control input-sm" name="srcChamp"
																		type="hidden" />
																	<div class="form-group col-md-3">
																		<label for="goalA" id="teamA"></label> <input
																			id="goalA" class="form-control input-sm" name="goalA"
																			value="0" />
																	</div>
																	<div class="form-group col-md-3">
																		<label for="goalB" id="teamB"></label> <input
																			id="goalB" value="0" class="form-control input-sm"
																			name="goalB" />
																	</div>
																	<input class="btn btn-success btn-sm" type="submit"
																		value="Update">


																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>


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
	$(document).on("click", "#btnDetail", function() {
		$("input#matchId").attr("value", $(this).data('id'));
		$("input#champId").attr("value", $(this).data('champid'));
		$("input#goalA").attr("value", $(this).data('goala'));
		$("input#goalB").attr("value", $(this).data('goalb'));
		$("label#teamA").html($(this).data('teama'));
		$("label#teamB").html($(this).data('teamb'));
	});

	$(function() {
		$("#frmUpdateScore").validate({
			rules : {
				goalA : {
					required : true,
					number : true,
					minStrict : 0
				},
				goalB : {
					required : true,
					number : true,
					minStrict : 0
				}
			},
			messages : {
				goalA : {
					required : "Goal is required!",
					number : "Please enter a number!",
					minStrict : "At least 0!"
				},
				goalB : {
					required : "Goal is required!",
					number : "Please enter a number!",
					minStrict : "At least 0!"
				}
			}
		});
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