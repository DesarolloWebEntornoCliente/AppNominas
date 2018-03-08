<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Nominas</title>

<!-- BOOTSTRAP CSS -->
<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/resources/css/fonts/OLD/font-awesome.min.css" />">

</head>
<body>
	<div class="">
	
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-light fixed-top bg-light">
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
	
	<br>
	<div class="container">
	<div class="row">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	  </div>
	
	</div>
	</div>
		<c:if test="${!empty listarU}">
			<table class="table table-md-6 table-striped table-inverse">
				<thead>
					<tr>
						<th>Correo</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Edad</th>

						<th></th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${listarU}" var="u">

						<tr>
							<td>${u.getEmail() }</td>
							<td>${u.getNombre()}</td>
							<td>${u.getLogin()}</td>

							<td>
										
							</td>

						</tr>

					</c:forEach>
				</tbody>
			</table>

		</c:if>
	</div>

	<!-- FIN Tabla De Juegos -->

	</div>
	<br />
	<br />



	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

</body>
</html>