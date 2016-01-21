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
			<div class="col-lg-10">
				<c:choose>
					<c:when test="${listChamp.size() == 0 || listChamp == null}">
						<font color="red">No data</font>
					</c:when>
					<c:otherwise>
						<table class="table table-hover" id="tableChamp">
							<thead>
								<tr>
									<th>&nbsp;</th>
									<th>Championship</th>
									<th>Short Name</th>
									<th>Season</th>
									<th>Formula</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="champ" items="${listChamp }" varStatus="no">
									<tr>
										<td><img alt="${champ.fullName }" width="30px"
											src="<c:url value="${champ.logoUrl}" />" /></td>
										<td>${champ.fullName}</td>
										<td>${champ.shortName}</td>
										<td>${champ.season}</td>
										<td><h4><span
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
										</span></h4></td>
										<td><a href="#" data-toggle="modal"
											data-target="#modalModifyChamp" data-id="${champ.champId }"
											data-fullname="${champ.fullName }"
											data-formula="${champ.formula }"
											data-season="${champ.season }"
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
										</a>
										<a href="match?srcChamp=${champ.champId }" id="match">
												<button type="button" class="btn btn-danger btn-sm">
													<span class="glyphicon glyphicon-calendar"></span>
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
												name="champSeason" path="season"  />
										</div>
										<div class="form-group col-md-4">
											<label for="formula"> Formula </label> <select
												id="formula" class="form-control input-sm" name="formula">
												<option id="FTOUR" value="FTOUR">Tournament</option>
												<option id="FLEAG" value="FLEAG">League</option>
												<option id="FPOFF" value="FPOFF">Play-off</option>
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
								<h4 class="modal-title" id="myModalLabel">MODIFY CHAMPIONSHIP</h4>
							</div>

							<div class="col-md-12">
								<div class="modal-body">

									<form method="POST" role="form" action="modifyChamp"
										id="frmModifyChamp">
										<input id="champId" class="form-control input-sm" name="champId"
											type="hidden" />
										<div class="form-group col-md-6">
											<label for="champName">Championship</label>
											<input id="champName" class="form-control input-sm"
												name="champName" />
										</div>
										<div class="form-group col-md-3">
											<label for="champShrtName">Short Name</label>
											<input id="champShrtName" class="form-control input-sm"
												name="champShrtName"  />
										</div>

										<div class="form-group col-md-3">
											<label for="champSeason">Season</label>
											<input id="champSeason" class="form-control input-sm"
												name="champSeason" />
										</div>
										<div class="form-group col-md-4">
											<label for="formula"> Formula </label> <select
												id="formula" class="form-control input-sm" name="formula">
												<option id="FTOUR" value="FTOUR">Tournament</option>
												<option id="FLEAG" value="FLEAG">League</option>
												<option id="FPOFF" value="FPOFF">Play-off</option>
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
				'aTargets' : [ 0, 2 ]
			} ]
		});
	});
	$(document).on(
			"click",
			"#updChamp",
			function() {
				$("input#champId").attr("value", $(this).data('id'));
				$("input#champName").attr("value", $(this).data('fullname'));
				$("input#champShrtName").attr("value", $(this).data('shortname'));
				$("input#champSeason").attr("value", $(this).data('season'));
				
				if ($(this).data('formula') == $("option#" + $(this).data('formula'))
						.val()) {
					$("option#" + $(this).data('formula')).attr("selected",
							"selected");
				}
			});
	$(document).on("click", "#updLogo", function() {
		$("input#champId").attr("value", $(this).data('id'));

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