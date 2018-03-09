<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<meta charset="utf-8">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.min.css" />">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Conceptos</title>
</head>
<body>
<div style="background-color: ">
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-light bg-light">
			<figure class="figure mt-0 mb-0">
				<a class="navbar-brand" href=""><img
					src="<c:url value="/resources/images/nominaLogo.png" />"	class="figure-img img-fluid rounded" alt="" style="width: 20%;"></a>
			</figure>

			<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">

				<a href="usuarios" role="button" class="btn btn-outline-success btn-sm derecha">Usuarios</a>
				<a href="conceptos" role="button" class="btn btn-outline-success btn-sm derecha" style="margin-left: 1%">Conceptos</a>
				<a href="nominasReferencia" role="button" class="btn btn-outline-success btn-sm derecha" style="margin-left: 1%">Nominas</a>
			</div>

			<a href="cerrarSesion" role="button" class="btn btn-info btn-sm derecha">Cerrar Sesión</a>
		</nav>

	<div class="container"  style="margin-top: 2% ">
	<div class="row">
		<div class="col-6 col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Adiciona / Edita Conceptos</h3>
				</div>
				<div class="panel-body">
					<c:url value="/adicionaEdita" var="add"></c:url>
					<f:form action="${add }" commandName="concepto" class="form" role="form" >
						<div class="form-group">
							<c:if test="${!empty concepto.descripcion }"></c:if>
							<f:label path="idConcepto"><t:message code="" text="Codigo"></t:message> </f:label>
							<f:input path="idConcepto" class="form-control" readonly="true" disabled="true" />
							<f:hidden path="idConcepto"/>
						</div>
						<div class="form-group">
							<f:label path="descripcion"><t:message code="" text="Descripción"></t:message></f:label>
							<f:input path="descripcion" class="form-control"/>
						</div>
						<div class="form-group">
							<f:label path="impuesto"><t:message code="" text="Impuesto"></t:message></f:label>
							<f:input path="impuesto" class="form-control"/>
						</div>	
						
						<div class="form-group">
							<f:label path="tipo"><t:message code="" text="Tipo"></t:message></f:label>
								<select class="form-control" name="tipo" id="tipo">
							      	<option value="0">Seleccione un Tipo</option>							      	
							      	<option value="D">Debito</option>							      								      													
							      	<option value="C">Credito</option>							      								      													
								</select>														
						</div>						
	
						<c:choose>
							<c:when test="${!empty concepto.descripcion }">
								<input type="submit" value="<t:message code="" text="Editar Concepto" />" class="btn btn-info">
							</c:when>
							<c:otherwise>
								<input type="submit" value="<t:message code="" text="Añadir Concepto" />" class="btn btn-primary">
							</c:otherwise>
						</c:choose>
						<td><a class="btn btn-primary btn-xs" href='<c:url value="/principalAdmin"></c:url>'>Volver</a></td>
															
					</f:form>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-sm col-md">
				<c:if test="${!empty listConceptos }">
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Descripción</th>
							<th>Impuesto</th>
							<th>Tipo</th>
							<th>Editar</th>
							<th>Borrar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listConceptos}" var="cp">
							<tr>
								<td>${cp.descripcion }</td>
								<td>${cp.impuesto }</td>
								<td>${cp.tipo }</td>
								
								<td>
								<button type="button" class="btn btn-danger" data-toggle="modal"
									data-target="#ModalCenterBorrar${cp.getIdConcepto()}">Borrar</button>
								</td>
								
								<td><a class="btn btn-info btn-xs" href='<c:url value="/edit/${cp.idConcepto }"></c:url>'>Edit</a></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </c:if>
			</div>
		</div>
	</div>
</div>
	</div>

<!-- Modal -->
			<c:forEach items="${listConceptos}" var="cp">
				<div class="modal fade" id="ModalCenterBorrar${cp.getIdConcepto()}"
					tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="ModalCenterLongTitle">¿Seguro
									que desea eliminar ${cp.getDescripcion()} ?</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">No</button>
								<a
									href="<c:url value="/deleteConcepto?idConcepto=${cp.getIdConcepto()}"/>"><button
										type="button" class="btn btn-primary">Si</button></a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
	<!-- Optional JavaScript -->
	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>