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
					<a href="toChampionship">
						<button type="button" class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-arrow-left"></span>
						</button>
					</a> <img alt="${champ.fullName }" width="25px"
						src="<c:url value="${champ.logoUrl}" />" /> ${champ.fullName }&nbsp;
					<c:if test="${champ.formula == 'FTOUR' }">
						<a href="toAddGroup?champId=${champ.champId }"><button
								class="btn btn-success btn-sm" name="submit" type="button"
								value="Add">Groups</button></a>
					</c:if>
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
		<c:forEach items="${rounds}" var="round">
			<div class="panel panel-info">
				<div class="panel panel-heading">
					<c:forEach var="it" items="${sessionScope.Items}">
						<c:if
							test="${ it.item eq round and it.language eq champ.language }">
							<i>${it.description }</i>
						</c:if>
					</c:forEach>
					<a href="#" data-toggle="modal" data-target="#modalImportStadium"
						data-champid="${champ.champId }" data-round="${round }"
						style="float: right;" id="btnImpMatch">
						<button type="submit" class="btn btn-xs btn-warning">
							<span class=" glyphicon glyphicon-save-file"></span> Import
						</button>
					</a>
				</div>
				<div class="panel panel-body">
					<c:if test="${round.startsWith('TRGR') eq true}">

						<div class="col-lg-10">
							<c:if test="${A.size() > 0 and round eq 'TRGRA'}">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${A }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${B.size() > 0 and round eq 'TRGRB'}">
								<!-- Group B-->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${B }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${C.size() > 0 and round eq 'TRGRC' }">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${C }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${D.size() > 0 and round eq 'TRGRD'}">
								<!-- Group D -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${D }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${E.size() > 0 and round eq 'TRGRE'}">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${E }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${F.size() > 0 and round eq 'TRGRF' }">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${F }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${G.size() > 0 and round eq 'TRGRG'}">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${G }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
							<c:if test="${H.size() > 0 and round eq 'TRGRH'}">
								<!-- Group A -->
								<table class="table table-hover" id="tableStandings">
									<thead>
										<tr>
											<th>&nbsp;</th>
											<th>Team</th>
											<th>M</th>
											<th>W</th>
											<th>D</th>
											<th>L</th>
											<th>GF</th>
											<th>GA</th>
											<th>GD</th>
											<th>P</th>
										</tr>

									</thead>
									<tbody>

										<c:forEach var="standing" items="${H }" varStatus="rank">
											<tr>
												<td><b>${rank.count }</b></td>
												<td>${standing.team.fullName }</td>
												<td>${standing.played }</td>
												<td>${standing.win}</td>
												<td>${standing.draw }</td>
												<td>${standing.loss}</td>
												<td>${standing.forGoals}</td>
												<td>${standing.againstGoals}</td>
												<td>${standing.diffGoals}</td>
												<td>${standing.points}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</c:if>
						</div>

					</c:if>
					<div class="col-lg-12">
						<c:choose>
							<c:when test="${listMatch.size() == 0 || listMatch == null}">
								<div class="alert alert-danger" role="alert">No data</div>
							</c:when>
							<c:otherwise>
								<table class="table table-hover" id="tableParti">

									<tbody>
										<c:forEach var="match" items="${listMatch}">
											<c:if test="${match.round eq round }">
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
																data-target="#modalUpdateScore"
																data-id="${match.matchId }"
																data-champid="${match.championship.champId }"
																data-goala="${match.goalA }"
																data-goalb="${match.goalB }"
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
																		<c:if
																			test="${scorer.team == 'A' and scorer.isStatus() eq true}">
																			<li><a>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
																					${scorer.time }<c:if
																						test="${scorer.addedTime != 0}">+${scorer.addedTime}</c:if>'
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
																		<c:if
																			test="${scorer.team == 'B' and scorer.isStatus() eq true }">
																			<li><a>${scorer.player.firstName }&nbsp;${scorer.player.lastName }
																					${scorer.time }<c:if
																						test="${scorer.addedTime != 0}">${scorer.addedTime}</c:if>'
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
																	<c:if test="${match.isPlayed() eq true }">
																		<li><a href="${lnkScorer }">Scorer</a></li>
																	</c:if>
																</ul>
															</div>
															<button type="button" class="btn btn-danger btm-xs">Live!</button>
														</div>
														<div class="modal fade" id="modalUpdateScore"
															tabindex="-1" role="dialog"
															aria-labelledby="myModalLabel" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">
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
																					<input id="from" class="form-control input-sm"
																						name="from" value="Standing" type="hidden"/> <input
																						id="matchId" class="form-control input-sm"
																						name="matchId" type="hidden" /> <input
																						id="champId" class="form-control input-sm"
																						name="srcChamp" type="hidden" />
																					<div class="form-group col-md-3">
																						<label for="goalA" id="teamA"></label> <input
																							id="goalA" class="form-control input-sm"
																							name="goalA" value="0" />
																					</div>
																					<div class="form-group col-md-3">
																						<label for="goalB" id="teamB"></label> <input
																							id="goalB" value="0"
																							class="form-control input-sm" name="goalB" />
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
											</c:if>
										</c:forEach>
									</tbody>

								</table>


							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="modal fade" id="modalImportStadium" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">IMPORT MATCHES</h4>
					</div>

					<form method="POST" role="form" action="importMatches"
						id="frmImportStadium" enctype="multipart/form-data">
						<div class="modal-body">
							<input type="hidden" id="champImpMatch" name="champId" /> <input
								type="hidden" id="roundImpMatch" name="round" />
							<dl class="dl-horizontal form-group">
								<dt>File Import:</dt>
								<dd>
									<input type="file" id="fileUpload" name="file">
								</dd>
							</dl>

						</div>
						<div class="modal-footer">
							<input class="btn btn-success btn-sm" type="submit"
								value="Upload">
							<button type="button" class="btn btn-danger btn-sm"
								data-dismiss="modal">Close</button>
						</div>
					</form>
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
	$(document).on("click", "#btnDetail", function() {
		$("input#matchId").attr("value", $(this).data('id'));
		$("input#champId").attr("value", $(this).data('champid'));
		$("input#goalA").attr("value", $(this).data('goala'));
		$("input#goalB").attr("value", $(this).data('goalb'));
		$("label#teamA").html($(this).data('teama'));
		$("label#teamB").html($(this).data('teamb'));
	});

	$(document).on("click", "#btnImpMatch", function() {
		$("input#champImpMatch").attr("value", $(this).data('champid'));
		$("input#roundImpMatch").attr("value", $(this).data('round'));
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