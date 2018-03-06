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
	
		<%-- <%
			if (session.getAttribute("usuLogeado") == null || session.isNew()) {
				response.sendRedirect("../index.jsp?mensaje=Inicie sesión");
			} else {

				Usuario ulog = (Usuario)session.getAttribute("usuLogeado");
				
				UsuarioDAO uDAO = new UsuarioDAOImplHibernate();
				List<Usuario> usuarios = uDAO.listarUsuarios();

				boolean esNulo2 = true;
				if (usuarios == null)
					esNulo2 = false;
		%> --%>
		<!-- Inicio -->
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<figure class="figure mt-0 mb-0">
				<a class="navbar-brand" href=""><img
					src="<c:url value="/resources/images/mando.png" />"
					class="figure-img img-fluid rounded" alt="Logo"
					style="height: 40px;"></a>
			</figure>


			<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">

				<a href="principalAdmin" role="button"
					class="btn btn-outline-success btn-sm derecha">Principal</a>
			</div>

			<a href="../cerrarSesion" role="button" class="btn btn-link btn-sm derecha">Cerrar Sesión</a>
		</nav>

		<!-- Fin Inicio -->
		<div>
			<br /> <br /> <br />
			<%-- <%
				String error = request.getParameter("mensaje");
					if (error != null) {
			%> --%>

			<!-- 	<div class="alert alert-warning alert-dismissable">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">x</button>
				<strong>Info!</strong> -->
			<%-- <%=error%> --%>
		</div>
		<%-- <%
				}
			%> --%>
	</div>

	<!-- inicio carousel -->

	<div class="mt-5" data-toggle="collapse">
	
	<br>
	<!-- Tabla De Juegos -->
	<div class="container">
	<div class="row">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
	    <label class="input-group-text" for="inputGroupSelect01">Options</label>
	  </div>
	  <select class="custom-select" id="inputGroupSelect01">
	    <option selected>Seleccione el Mes ...</option>
	    <option value="1">Enero</option>
	    <option value="2">Febrero</option>
	    <option value="3">Marzo</option>
	    <option value="4">Abril</option>
	    <option value="5">Mayo</option>
	    <option value="6">Junyo</option>
	    <option value="7">Julio</option>
	    <option value="8">Agosto</option>
	    <option value="9">Septiembre</option>
	    <option value="10">Octubre</option>
	    <option value="11">Noviembre</option>
	    <option value="12">Diciembre</option>
	  </select>
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


	<%-- 	<%
		}
	%> --%>



	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script
		src="
      <c:url value="/resources/js/popper.min.js" />
      "></script>
	<script
		src="
      <c:url value="/resources/js/bootstrap.min.js" />
      "></script>

</body>
</html>