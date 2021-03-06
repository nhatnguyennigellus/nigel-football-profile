<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>
		Championship <a href="#" data-toggle="modal"
			data-target="#modalAddChamp">
			<button type="submit" class="btn btn-success">
				<span class=" glyphicon glyphicon-plus"></span> Add
			</button>
		</a>
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
		<div class="row">
			<div class="col-lg-12">
				<c:choose>
					<c:when test="${listChamp.size() == 0 || listChamp == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-hover" id="tableChamp">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>Championship </th>
									<th>Season</th>
									<th>Teams--Groups--Teams/Group</th>
									<th>Formula</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="champ" items="${listChamp }" varStatus="no">
									<tr>
										<td><img alt="${champ.fullName }" width="30px"
											src="<c:url value="${champ.logoUrl}" />" /></td>
										<td><b>${champ.fullName}</b> #${champ.shortName}</td>
										<td>${champ.season}</td>
										<td>${champ.participantNo} -- ${champ.groupNo} -- ${champ.teamsPerGroup}</td>
										<td><h4>
												<span
													<c:if test="${champ.formula == 'FTOUR' }">
											class="label label-primary label-lg"
										</c:if>
													<c:if test="${champ.formula == 'FLEAG' }">
											class="label label-danger label-lg"
										</c:if>
													<c:if test="${champ.formula == 'FPOFF' }">
											class="label label-success label-lg"
										</c:if>>
													<c:if test="${champ.formula == 'FTOUR' }">
											Tournament
										</c:if> <c:if test="${champ.formula == 'FLEAG' }">
											League
										</c:if> <c:if test="${champ.formula == 'FPOFF' }">
											Play-off
										</c:if>
												</span>
											</h4></td>
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyChamp" data-id="${champ.champId }"
											data-fullname="${champ.fullName }"
											data-formula="${champ.formula }"
											data-season="${champ.season }"
											data-groupno="${champ.groupNo}"
											data-partino="${champ.participantNo}"
											data-partigroup="${champ.teamsPerGroup}"
											data-language="${champ.language}"
											data-rounds="${champ.rounds}"
											data-shortname="${champ.shortName }" id="updChamp">
												<button type="button" class="btn btn-primary btn-sm">
													<span class="glyphicon glyphicon-edit"></span>
												</button>
										</a> <a href="#" data-toggle="modal" data-target="#modalLogo"
											data-id="${champ.champId }" id="updLogo">
												<button type="button" class="btn btn-warning btn-sm">
													<span class="glyphicon glyphicon-bookmark"></span>
												</button>
										</a> <a href="participant?champId=${champ.champId }" id="part">
												<button type="button" class="btn btn-success btn-sm">
													<span class="glyphicon glyphicon-user"></span>
												</button>
										</a> <a href="match?srcChamp=${champ.champId }" id="match">
												<button type="button" class="btn btn-danger btn-sm">
													<span class="glyphicon glyphicon-calendar"></span>
												</button>
										</a> <a href="standing?srcChamp=${champ.champId }" id="group">
												<button type="button" class="btn btn-info btn-sm">
													<span class="glyphicon glyphicon-list-alt"></span>
												</button>
										</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:otherwise>
				</c:choose>

				<div class="modal fade" id="modalLogo" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">ADD LOGO</h4>
							</div>

							<form method="POST" role="form" action="uploadLogoChamp"
								id="frmUploadLogo" enctype="multipart/form-data">
								<div class="modal-body">
									<input type="hidden" id="champId" name="champId" />
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

				<div class="modal fade" id="modalAddChamp" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">NEW CHAMPIONSHIP</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form:form method="POST" role="form" action="addChamp"
										id="frmAddChamp" modelAttribute="champ">

										<div class="form-group col-md-6">
											<label for="champName">Championship</label>
											<form:input id="champName" class="form-control input-sm"
												name="champName" path="fullName" />
										</div>
										<div class="form-group col-md-3">
											<label for="champShrtName">Short Name</label>
											<form:input id="champShrtName" class="form-control input-sm"
												name="champShrtName" path="shortName" />
										</div>

										<div class="form-group col-md-3">
											<label for="champSeason">Season</label>
											<form:input id="champSeason" class="form-control input-sm"
												name="champSeason" path="season" />
										</div>

										<div class="form-group col-md-3">
											<label for="champPartiNo">Participants</label> <input
												type="number" step="2" min="${partiNoMin }"
												max="${partiNoMax }" id="champPartiNo" value="4"
												class="form-control input-sm" name="champPartiNo" />
										</div>
										<div class="form-group col-md-3">
											<label for="champGrpNo">Groups</label> <select
												id="champGrpNo" class="form-control input-sm"
												name="champGrpNo">
												<c:forEach items="${lstGrpNo }" var="no">
													<option id="G${no }" value="${no }">${no }</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-3">
											<label for="champTeamGrp">Teams/Group</label>
											<form:input id="champTeamGrp" class="form-control input-sm" value="4"
												readonly="true" name="champTeamGrp" path="teamsPerGroup" />
										</div>
										<div class="form-group col-md-4">
											<label for="formula"> Formula </label> <select id="formula"
												class="form-control input-sm" name="formula">
												<option id="FTOUR" value="FTOUR">Tournament</option>
												<option id="FLEAG" value="FLEAG">League</option>
												<option id="FPOFF" value="FPOFF">Play-off</option>
											</select>
										</div>
										<div class="form-group col-md-4">
											<label for="champLanguage"> Language </label> <select id="champLanguage"
												class="form-control input-sm" name="champLanguage">
												<c:forEach items="${lstLang }" var="lang">
													<option id="G${lang.item}" value="${lang.item }">${lang.description}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-4">
											<label for="champRndFmt"> Round Format </label> <select id="champRndFmt"
												class="form-control input-sm" name="champRndFmt">
												<c:forEach items="${lstRndFmt }" var="rf">
													<option id="G${rf.item}" value="${rf.item }">${rf.item}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-12">
											<button class="btn btn-success btn-sm" name="submit"
												type="submit" value="Add">Add</button>
										</div>
									</form:form>

								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger btn-sm"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<div class="modal fade" id="modalModifyChamp" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="myModalLabel">MODIFY
									CHAMPIONSHIP</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyChamp"
										id="frmModifyChamp">
										<input id="champUpdId" class="form-control input-sm"
											name="champId" type="hidden" />
										<div class="form-group col-md-6">
											<label for="champUpdName">Championship</label> <input
												id="champUpdName" class="form-control input-sm"
												name="champName" />
										</div>
										<div class="form-group col-md-3">
											<label for="champUpdShrtName">Short Name</label> <input
												id="champUpdShrtName" class="form-control input-sm"
												name="champShrtName" />
										</div>

										<div class="form-group col-md-3">
											<label for="champUpdSeason">Season</label> <input
												id="champUpdSeason" class="form-control input-sm"
												name="champSeason" />
										</div>
										<div class="form-group col-md-3">
											<label for="champPartiNo">Participants</label> <input
												type="number" step="2" min="${partiNoMin }"
												max="${partiNoMax }" id="champUpdPartiNo" value="4"
												class="form-control input-sm" name="champPartiNo" />
										</div>
										<div class="form-group col-md-3">
											<label for="champUpdGrpNo">Groups</label> <select
												id="champUpdGrpNo" class="form-control input-sm"
												name="champGrpNo">
												<c:forEach items="${lstGrpNo }" var="no">
													<option id="G${no }" value="${no }">${no }</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-3">
											<label for="champUpdTmGrp">Teams/Group</label>
											<input id="champUpdTmGrp" class="form-control input-sm" value="4"
												readonly="true" name="champTeamGrp"/>
										</div>
										<div class="form-group col-md-4">
											<label for="champUpdFormula"> Formula </label> <select id="champUpdFormula"
												class="form-control input-sm" name="champFormula">
												<option id="FTOUR" value="FTOUR">Tournament</option>
												<option id="FLEAG" value="FLEAG">League</option>
												<option id="FPOFF" value="FPOFF">Play-off</option>
											</select>
										</div>
										<div class="form-group col-md-4">
											<label for="champUpdLang"> Language </label> <select id="champUpdLang"
												class="form-control input-sm" name="champLanguage">
												<c:forEach items="${lstLang }" var="lang">
													<option id="G${lang.item}" value="${lang.item }">${lang.description}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-4">
											<label for="champUpdRndFmt"> Round Format </label> <select id="champUpdRndFmt"
												class="form-control input-sm" name="champUpdRndFmt">
												<c:forEach items="${lstRndFmt }" var="rf">
													<option id="G${rf.item}" value="${rf.item }">${rf.item}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group col-md-12">
											<button class="btn btn-success btn-sm" name="submit"
												type="submit" value="Update">Update</button>
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
		$('#tableChamp').dataTable({
			"pagingType" : "simple",
			"aoColumnDefs" : [ {
				'bSortable' : false,
				'aTargets' : [ 0, 1, 2, 3, 4 ]
			} ]
		});
		
		
	});
	$(document).on(
			"click",
			"#updChamp",
			function() {
				$("input#champUpdId").attr("value", $(this).data('id'));
				$("input#champUpdName").attr("value", $(this).data('fullname'));
				$("input#champUpdShrtName").attr("value",
						$(this).data('shortname'));
				$("input#champUpdSeason").attr("value", $(this).data('season'));
				$("input#champUpdPartiNo").attr("value", $(this).data('partino'));
				$("input#champUpdTmGrp").attr("value", $(this).data('partigroup'));

				if ($(this).data('champUpdGrpNo') == $(
						"option#G" + $(this).data('groupno')).val()) {
					$("option#G" + $(this).data('groupno')).attr("selected",
							"selected");
				}
				
				if ($(this).data('formula') == $(
						"option#" + $(this).data('formula')).val()) {
					$("option#" + $(this).data('formula')).attr("selected",
							"selected");
				}
				
				if ($(this).data('language') == $(
						"option#G" + $(this).data('language')).val()) {
					$("option#G" + $(this).data('language')).attr("selected",
							"selected");
				}
				
				if ($(this).data('rounds') == $(
						"option#G" + $(this).data('rounds')).val()) {
					$("option#G" + $(this).data('rounds')).attr("selected",
							"selected");
				}
			});
	$(document).on("click", "#updLogo", function() {
		$("input#champId").attr("value", $(this).data('id'));

	});
	$('select#formula').change(
			function() {
				if ($("select#formula option:selected").val() === "FLEAG"
						|| $("select#formula option:selected").val() === "FPOFF") {
					$("select#champGrpNo").val("1");
					$("select#champGrpNo").attr("readonly", "true");
				}
				else {
					$("select#champGrpNo").removeAttr("readonly");
				}
				
				
				var pNo = $("#champPartiNo").val();
				var gNo = $("#champGrpNo option:selected").text();
				$("#champTeamGrp").val(pNo / gNo);
			});
	$("#champPartiNo").change(function() {
		var pNo = $("#champPartiNo").val();
		var gNo = $("#champGrpNo option:selected").text();
		$("#champTeamGrp").val(pNo / gNo);
	});

	$("#champGrpNo").change(function() {
		var pNo = $("#champPartiNo").val();
		var gNo = $("#champGrpNo option:selected").text();
		$("#champTeamGrp").val(pNo / gNo);
	});

	$("#champUpdPartiNo").change(function() {
		var pNo = $("#champUpdPartiNo").val();
		var gNo = $("#champUpdGrpNo option:selected").text();
		$("#champUpdTmGrp").val(pNo / gNo);
	});

	$("#champUpdGrpNo").change(function() {
		var pNo = $("#champUpdPartiNo").val();
		var gNo = $("#champUpdGrpNo option:selected").text();
		$("#champUpdTmGrp").val(pNo / gNo);
	});

	$(function() {
		$("#frmAddChamp").validate({
			rules : {
				fullName : {
					required : true,
				},
				shortName : {
					required : true,
				},
				season : {
					required : true,
				},
				champPartiNo : {
					required : true,
				}
			},
			messages : {
				fullName : {
					required : "Championship is required!",
				},
				shortName : {
					required : "Short Name is required!",
				},
				season : {
					required : "Season is required!",
				},
				champPartiNo : {
					required : "No. of participants is required!",
				}
			}
		});
		$("#frmModifyChamp").validate({
			rules : {
				champName : {
					required : true,
				},
				champShrtName : {
					required : true,
				},
				champSeason : {
					required : true,
				},
				champPartiNo : {
					required : true,
				}
			},
			messages : {
				champName : {
					required : "Championship is required!",
				},
				champShrtName : {
					required : "Short Name is required!",
				},
				champSeason : {
					required : "Season is required!",
				},
				champPartiNo : {
					required : "No. of participants is required!",
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