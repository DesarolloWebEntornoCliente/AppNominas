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
					<h3 class="panel-title">Edita Perfil de Usuario</h3>
				</div>
				<div class="panel-body">
					<c:url value="/adicionaEditaUsuario/100" var="add"></c:url>
					<f:form action="${add }" commandName="usuario" class="form" role="form" method="post"> 
						<div class="form-group">
							<f:label path="idUsuario"><t:message code="" text="Codigo"></t:message> </f:label>
							<f:input path="idUsuario" class="form-control" readonly="true" disabled="true" />
						</div>
						<div class="form-group">
							<f:label path="nombre"><t:message code="" text="Nombre"></t:message></f:label>
							<f:input path="nombre" class="form-control"  required="required" />
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
							<f:label path="tipo"><t:message code="" text="Tipo" ></t:message></f:label>
							<f:input path="tipo" class="form-control" readonly="true"/> 
						</div>	

						<input type="submit" value="<t:message code="" text="Editar Perfil" />" class="btn btn-info">
															
					</f:form>
				</div>
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