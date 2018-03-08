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
<title>Usuarios</title>
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

	<div class="container" style="margin-top: 2% ">
	<div class="row">
		<div class="col-6 col-md-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Adiciona / Edita Usuarios</h3>
				</div>
				<div class="panel-body">
					<c:url value="/adicionaEditaUsuario/50" var="add"></c:url>
					<f:form action="${add }" commandName="usuario" class="form" role="form" >
						<div class="form-group">
							<c:if test="${!empty usuario.nombre }">
							<f:label path="idUsuario"><t:message code="" text="Codigo"></t:message> </f:label>
							<f:input path="idUsuario" class="form-control" readonly="true" disabled="true" />
							<f:hidden path="idUsuario"/>
							</c:if>
						</div>
						<div class="form-group">
							<f:label path="nombre"><t:message code="" text="Nombre"></t:message></f:label>
							<f:input path="nombre" class="form-control" required="required" />
						</div>
						<div class="form-group">
							<f:label path="email"><t:message code="" text="Correo"></t:message></f:label>
							<f:input path="email" type="email" class="form-control"  required="required" />
						</div>					
								
						<div class="form-group">
							<f:label path="login"><t:message code="" text="Login"></t:message></f:label>
							<f:input path="login" type="text" class="form-control"  required="required" />
						</div>	
						<div class="form-group">
							<f:label path="password"><t:message code="" text="Contraseña"></t:message></f:label>
							<f:input path="password" type="password" class="form-control"  required="required" />
						</div>	

						<div class="form-group">
							<f:label path="tipo"><t:message code="" text="Tipo"></t:message></f:label>
							<f:input path="tipo" class="form-control" required="required" />
						</div>	

						<c:choose>
							<c:when test="${!empty usuario.nombre }">
								<input type="submit" value="<t:message code="" text="Editar Usuario" />" class="btn btn-info">
							</c:when>
							<c:otherwise>
								<input type="submit" value="<t:message code="" text="Añadir Usuario" />" class="btn btn-primary">
							</c:otherwise>
						</c:choose>
															
					</f:form>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-12 col-md-8">
				<c:if test="${!empty listUsuarios }">
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Correo</th>
							<th>Login</th>
							<th>Tipo</th>
							<th>Editar</th>
							<th>Borrar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listUsuarios}" var="u">
							<tr>
								<td>${u.nombre }</td>
								<td>${u.email }</td>
								<td>${u.login }</td>
								<td>${u.tipo }</td>
								<td><a class="btn btn-info btn-xs" href='<c:url value="/editUsuario/${u.idUsuario }"></c:url>'>Edit</a></td>
								<td><a class="btn btn-danger btn-xs" href='<c:url value="/deleteUsuario/${u.idUsuario }"></c:url>'>Del</a></td>
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

	<!-- Optional JavaScript -->
	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>