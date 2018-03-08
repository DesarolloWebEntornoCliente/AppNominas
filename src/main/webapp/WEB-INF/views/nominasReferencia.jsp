<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.min.css" />">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nominas</title>
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

			<a href="/cerrarSesion" role="button" class="btn btn-info btn-sm derecha">Cerrar Sesión</a>
		</nav>


	<div class="container"  style="margin-top: 2% ">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Adiciona / Edita Nomina</h3>
				</div>
				<div class="panel-body">
					<c:url value="/adicionaEditaNomina" var="add"></c:url>
					<f:form action="${add }" commandName="nomina" class="form" role="form" >
			<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<c:if test="${!empty listNominasRef }">		
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Mes</th>
							<th>valor</th>
							<th>Usuario</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listNominasRef}" var="nr">
							<tr>
								<td>${nr.idNominaRef }</td>
								<td>${nr.mes }</td>
								<td>${nr.valor }</td>
								<td>${nr.getUsuarios().getNombre() }</td> 
								<td><a class="btn btn-info btn-xs" href='<c:url value="/nominas/${nr.getUsuarios().getIdUsuario() }/${nr.mes }"></c:url>'>Seleccionar</a></td>
								<td><a class="btn btn-info btn-xs" href='<c:url value="/verNomina/${nr.getUsuarios().getIdUsuario() }/${nr.mes }"></c:url>'>Ver Nomina</a></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </c:if>
			</div>
		</div>
															
					</f:form>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>