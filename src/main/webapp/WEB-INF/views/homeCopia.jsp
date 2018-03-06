<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page session="false"%>
<html>
<head>

<style>
h5 {
	color: black;
}
</style>

<title>N o m i n  a s</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- BOOTSTRAP CSS -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css" />">

<link href="/resources/css/CSS_Propio.css" rel="stylesheet" />

<link rel="stylesheet"
	href="<c:url value="/resources/fonts/OLD/font-awesome.css" />">
<script defer
	src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>


</head>
<body>
			<div class="container">
			<!-- Formulario Entrar -->
			<f:form action="entrar" class="form-inline" commandName="usu" method="POST">
				<div class="form-group">
					<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">

							<i class="far fa-envelope" aria-hidden="true"></i>
						</div>
						<f:input path="email" type="email" id="correo" name="correo" required="required"
							class="form-control" placeholder="Correo" />
					</div>




					<div class="input-group input-group-sm mb-2 mr-sm-2 mb-sm-0">
						<div class="input-group-addon">
							<i class="fa fa-key" aria-hidden="true"></i>
						</div>
						<f:input path="password" type="password" id="password" name="password"
							required="required" class="form-control" placeholder="Password" />
					</div>
					<input type="submit" class="btn btn-outline-success btn-sm mr-1" value="Entrar">
				</div>
			</f:form>
		</div>
</div>


 <div class="container">
  ${loginError}
  <div class="form-group form">
  <form action="login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Usuario</label>
    <input type="text" id="userId" name="userId" class="form-control"  placeholder="Nombre de Usuario">
    <small id="emailHelp" class="form-text text-muted">Introduzca el Login o Nick Name</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="password"name="password" placeholder="Password">
  </div>
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button id="loginButton" class="btn btn-primary form-control">Login</button>
</form>
</div>
</div>

<!-- 
					<c:if test="${!empty mensaje}">
						<div class="alert alert-warning alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">x</button>
							<strong>${mensaje}</strong>
							<%-- <%=error%> --%>
						</div>
						</c:if>
						
							<c:if test="${!empty errorLogin}">
						<div class="alert alert-warning alert-dismissable">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">x</button>
							<strong>${errorLogin}</strong>
							<%-- <%=error%> --%>
						</div>
						</c:if>

	<div>

		<!-- 	
							String error = request.getParameter("mensaje");
							if (error != null) {
						 

		<div class="alert alert-warning alert-dismissable">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">x</button>
			<strong>Info!</strong>
			<error
		</div>
		
						

	</div>
	
	<br />
	<!-- Tabla De Nominas 
	<div class="container">
		<c:if test="${!empty listarJ}"> 
		<table class="table table-md-6 table-striped table-inverse">
			<thead>
				<tr>
					<th class="">Id</th>
					<th class="">Valor</th>
					<th class="">Mes</th>
					<th class="">Concepto</th>
					<th class="">Usuario</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${listarJ}" var="n">
					<tr>
						<td>${n.idNomina }</td>
						<td>${n.valor }</td>
						<td>${n.mes }</td>
					</tr>
				</c:forEach> 
			</tbody>
		</table>
		</c:if> 
	</div>
 
	<!-- FIN Tabla De Juegos -->

	<!-- Optional JavaScript -->
	<!-- JQquery first, then Popper.js, the Bootsrap JS -->
	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>


</body>
</html>
