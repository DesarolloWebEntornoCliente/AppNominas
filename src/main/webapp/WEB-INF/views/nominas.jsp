<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
<link rel="stylesheet" href="<c:url value="/resources/fonts/OLD/font-awesome.css" />">
<link rel="stylesheet" href="<c:url value="/resources/fonts/OLD/font-awesome.min.css" />">

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

				<a href="../../usuarios" role="button" class="btn btn-outline-success btn-sm derecha">Usuarios</a>
				<a href="../../conceptos" role="button" class="btn btn-outline-success btn-sm derecha" style="margin-left: 1%">Conceptos</a>
				<a href="../../nominasReferencia" role="button" class="btn btn-outline-success btn-sm derecha" style="margin-left: 1%">Nominas</a>
			</div>

			<a href="../../cerrarSesion" role="button" class="btn btn-info btn-sm derecha">Cerrar Sesión</a>
		</nav>

	<div class="container" style="margin-top: 2% ">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Adiciona / Edita Nomina</h3>
				</div>
				<div class="panel-body">
					<c:url value="/adicionaEditaNomina" var="add"></c:url>
					<f:form action="${add }" commandName="nomina" class="form" role="form"  method="post" >
						<div class="form-group">
							<c:if test="${nomina.getValor()} > 0">
								<f:label path="idNomina"><t:message code="" text="Codigo"></t:message> </f:label>
								<f:input path="idNomina" class="form-control" readonly="true" disabled="true" />
								<f:hidden path="idNomina"/>
							</c:if>
						</div>
						<div class="form-group">
						
						<c:choose>
							<c:when test="${mesActual.getIdMes() > 0}">
							<f:label path="mes"><t:message code="" text="Mes"></t:message></f:label>
							
								<select class="form-control" name="mes">				

									<option value="${mesActual.getIdMes()}">${mesActual.getDescMes()}</option>
											      													
								</select>				
						
							</c:when>
							<c:otherwise>
								<f:label path="mes"><t:message code="" text="Mes"></t:message></f:label>
								<select class="form-control" name="mes">
							   	<option value="0">Seleccione un Mes</option>							      	
							
										<c:forEach items="${listaMes}" var="lm">

											<option value="${lm.getIdMes()}">${lm.getDescMes()}</option>

										</c:forEach>							      													
								</select>				
								
							</c:otherwise>
						</c:choose>
						
						
						
																	
						</div>
						<div class="form-group">
							<f:label path="valor"><t:message code="" text="Valor"></t:message></f:label>
							<f:input path="valor"  value="${nomina.getValor() }" class="form-control required" type="number" required="required" />
						</div>	
	
						<!-- los selects -->
						<div class="form-group">
							<f:label path=""><t:message code="" text="Concepto"></t:message></f:label>
									<select class="form-control" name="concepto">
								      	<option value="0">Seleccione un Concepto</option>							      	
										<c:forEach items="${listaCon}" var="lc">

											<option value="${lc.getIdConcepto()}">${lc.getDescripcion()}</option>

										</c:forEach>					

									</select>
						</div>	
						
						<div class="form-group">
		
								<c:choose>
							<c:when test="${!empty usuario}">
							<f:label path=""><t:message code="" text="Usuario"></t:message></f:label>
							
								<select class="form-control" name="usuario">				

									<option value="${usuario.getIdUsuario()}">${usuario.getNombre()}</option>
											      													
								</select>						
							</c:when>
							<c:otherwise>
							<f:label path=""><t:message code="" text="Usuario"></t:message></f:label>
									<select class="form-control" name="usuario">
								      	<option value="0">Seleccione un Usuario</option>
										<c:forEach items="${listaUsu}" var="lu">

											<option value="${lu.getIdUsuario()}">${lu.getNombre()}</option>

										</c:forEach>					

									</select>			
								
							</c:otherwise>
						</c:choose>

						</div>								

						<c:choose>
							<c:when test="${nomina.valor > 0}">
								<input type="submit" value="<t:message code="" text="Editar Nomina" />" class="btn btn-info">
							</c:when>
							<c:otherwise>
								<input type="submit" value="<t:message code="" text="Añadir Nomina" />" class="btn btn-success">
							</c:otherwise>
						</c:choose>
								<td><a class="btn btn-primary btn-xs" href='<c:url value="/nominasReferencia"></c:url>'>Volver</a></td>
															
					</f:form>
				</div>
			</div>
		</div>
	
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<c:if test="${!empty listNominas }">
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Codigo</th>
							<th>Mes</th>
							<th>valor</th>
							<th>Concepto</th>
							<th>Usuario</th>
							<th>Editar</th>
							<th>Borrar</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listNominas}" var="nr">
							<tr>
								<td>${nr.idNomina }</td>
								<td>${nr.mes }</td>
								<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${nr.valor}"  pattern="##,###.00" /></td>	
								<td>${nr.getConceptos().getDescripcion() }</td>
								<td>${nr.getUsuarios().getNombre() }</td> 
								<td>
									<button type="button" class="btn btn-danger" data-toggle="modal"
									data-target="#ModalCenterBorrar${nr.getIdNomina()}">Borrar</button>
								</td>
								
								
								<td><a class="btn btn-info btn-xs" href='<c:url value="/editNomina/${nr.getIdNomina() }"></c:url>'>Edit</a></td>
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

<!-- Modal -->
			<c:forEach items="${listNominas}" var="nr">
				<div class="modal fade" id="ModalCenterBorrar${nr.getIdNomina()}"
					tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="ModalCenterLongTitle">¿Seguro
									que desea eliminar el Valor ${nr.getValor()} ?</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">No</button>
								<a
									href="<c:url value="/deleteNomina?idNomina=${nr.getIdNomina()}"/>"><button
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
</body>
</html>