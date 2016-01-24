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
	<h2>Items &nbsp;</h2>
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
	<div class="row" id="search">
		<div class="col-lg-12">
			<div class="panel panel-info">
				<div class="panel panel-body">
					<form action="item" class="form-inline">

						<div class="form-group" id="srchType">
							<label for="team">Type</label>
							<div class="input-group ">
								<span class="input-group-addon"> <span
									class=" glyphicon glyphicon-search"></span>
								</span> <select id="type" class="form-control input-sm" type="text"
									name="type">
									<option value="All">All</option>
									<c:forEach items="${listType }" var="type">
										<option value="${type}">${type}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group" id="srchLang">
							<label for="team">Language</label>
							<div class="input-group ">
								<span class="input-group-addon"> <span
									class=" glyphicon glyphicon-search"></span>
								</span> <select id="lang" class="form-control input-sm" type="text"
									name="lang">
									<option value="All">All</option>
									<c:forEach items="${listLang}" var="lang">
										<option value="${lang}">${lang}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-info btn-sm"
							id="submitSearch" name="search" value="Search">
							<span class="glyphicon glyphicon-search "></span> Search
						</button>
						<a href="#" data-toggle="modal" data-target="#modalAddItem">
							<button type="button" class="btn btn-success btn-sm" id="addItem">
								<span class=" glyphicon glyphicon-plus"></span> Add
							</button>
						</a>
					</form>
				</div>

			</div>
		</div>

	</div>

	<div class="row">
		<div class="col-lg-12">
			<c:choose>
				<c:when test="${listItem.size() == 0 || listItem == null}">
					<div class="alert alert-danger" role="alert">No data</div>
				</c:when>
				<c:otherwise>
					<table class="table table-striped" id="tableItem">
						<thead>
							<tr>
								<th>&nbsp;</th>
								<th>Item</th>
								<th>Description</th>
								<th>Language</th>
								<th>Type</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="it" items="${listItem }" varStatus="no">
								<tr>
									<td>${no.count }</td>
									<td>${it.item }</td>
									<td>${it.description }</td>
									<td>${it.language}</td>
									<td>${it.type}</td>
									<td><a href="#" data-toggle="modal"
										data-target="#modalModifyPart" data-stateid="${part.stateId }"
										data-champid="${part.championship.champId }"
										data-champname="${part.championship.fullName }"
										data-team="${part.team.fullName}"
										data-statuz="${part.statuz }" id="updState">
											<button type="button" class="btn btn-primary btn-sm">
												<span class="glyphicon glyphicon-edit"></span>
											</button>
									</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>

			</c:choose>

			<!-- Add Modal -->
			<div class="modal fade" id="modalAddItem" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title" id="myModalLabel">NEW ITEM</h4>
						</div>

						<div class="col-md-12">
							<div class="modal-body">

								<form:form method="POST" role="form" action="addItem"
									id="frmAddItem" modelAttribute="item">

									<div class="form-group col-md-4">
										<label for="item">Item</label>
										<form:input id="item" class="form-control input-sm"
											name="item" path="item" />
									</div>
									<div class="form-group col-md-8">
										<label for="desc">Description</label>
										<form:input id="desc" class="form-control input-sm"
											name="desc" path="description" />
									</div>

									<div class="form-group col-md-6">
										<label for="type">Type</label> <select id="type"
											class="form-control input-sm" name="type">
											<c:forEach var="type" items="${listType}">
												<option value="${type}">${type}</option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group col-md-6">
										<label for="language">Language</label> <select id="language"
											class="form-control input-sm" name="language">
											<c:forEach var="lang" items="${listLang}">
												<option value="${lang}">${lang}</option>
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
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('#tableItem').dataTable({
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

	$(function() {
		$("#frmAddItem").validate({
			rules : {
				item : {
					required : true,
				},
				description : {
					required : true,
				},
				
			},
			messages : {
				item : {
					required : "Item is required!",
				},
				description : {
					required : "Description is required!",
				},
			}
		});
		/* $("#frmModifyStadium").validate({
			rules : {
				stdName : {
					required : true,
				},
				stdUefaName : {
					required : true,
				},
				stdCapacity : {
					required : true,
					number : true,
					minStrict : 0
				}
			},
			messages : {
				stdName : {
					required : "Stadium Name is required!",
				},
				stdUefaName : {
					required : "Stadium UEFA Name is required!",
				},
				stdCapacity : {
					required : "Capacity is required!",
					number : "Capacity must be a number!",
					minStrict : "Capacity must be above zero!"
				}
			}
		}); */
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