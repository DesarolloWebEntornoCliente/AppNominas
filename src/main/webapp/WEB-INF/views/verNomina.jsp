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

<div class="">
	
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

	<div class="container" style="margin-top: 1% ">
		<div class="row" >
					<div class="col-sm">
		
		<div class="alert alert-secondary" role="alert" style="margin-top: 2%">
			<p>Usuario :  <c:out value = "${usu.nombre}"/>
				<a style="margin-left: 30%;" class="btn btn-primary btn-xs" href='<c:url value="../../nominasReferencia"></c:url>'>Volver</a>	<p>					
		</p>
		</div>
				
		</div>
		</div>
	
		<div class="row">
			<div class="col-sm">
				<c:if test="${!empty listNominas }">
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Concepto</th>
							<th></th>
							<th style="text-align:right">Devengos</th>
							<th style="text-align:right">Deducciones</th>
						</tr>
					</thead>

						<c:set var="devengos" value="${0}"/>
						<c:set var="deducciones" value="${0}"/>
						<c:set var="totales" value="${0}"/>
						
						<c:set var="desc1" value="${0}"/>
						<c:set var="desc2" value="${0}"/>
						<c:set var="desc3" value="${0}"/>
						<c:set var="tasa" value="${0}"/>
						<c:set var="descIrpf" value="${0}"/>
												

					<tbody style="text-align:right">
						<c:forEach items="${listNominas}" var="nr">
							<tr>
								<td>${nr.getConceptos().getDescripcion() }</td>
								<td></td>
								<c:if test='${nr.getConceptos().getTipo() == "C"}'>
									<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${nr.valor}"  pattern="##,###.00" /></td>	
									<td></td>
									<c:set var="devengos" value="${devengos + nr.valor}"/> 
								</c:if>			
								<c:if test='${nr.getConceptos().getTipo() == "D"}'>
									<td></td>	
									<c:set var="deducciones" value="${deducciones + nr.valor}" /> 								
									<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${nr.valor}"  pattern="##,###.00" /></td>	
								</c:if>	
							</tr>
						</c:forEach>
						<tr></tr>
						
							<c:set var="desc1" value="${devengos * 4.7 /100}"/> 
							<c:set var="desc2" value="${devengos * 0.10 /100}"/> 
							<c:set var="desc3" value="${devengos * 1.6 /100}"/> 
						
							<c:forEach items="${listaIrpf}" var="ir">							
								<c:if test='${(devengos  * 12) > ir.de && (devengos * 12) < ir.hasta }'>
									<c:set var="tasa" value="${ir.getPercentual()}" /> 								
								</c:if>	
							</c:forEach>
						
							<c:set var="descIrpf" value="${devengos * tasa / 100}"/>
						
						
						<!--  Lamza las deducciones comunes -->
						
						<tr>
							<td>Cotizacion Cont Comu</td>
							<td>4.7</td>
							<td></td>
							<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${desc1 }"  pattern="##,###.##" /></td>	
						</tr>
						<tr>
							<td>Cotizacion Formación</td>
							<td>0.10</td>
							<td></td>
							<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${desc2 }"  pattern="##,###.00" /></td>	
						</tr>
						<tr>
							<td>Cotización Desempleo</td>
							<td>1.6</td>
							<td></td>
							<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${desc3 }"  pattern="##,###.00" /></td>	
						</tr>
												
						<tr>
							<td>I.R.P.F</td>
							<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${tasa }"  pattern="##,###.00" /></td>	
							<td></td>
							<td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${descIrpf }"  pattern="##,###.00" /></td>	
						</tr>


						  <tr>
						     <td>Liquido a Recibir</td>
						     <td></td>
						     <td></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos - (deducciones + desc1 + desc2 + desc3 + descIrpf)}"  pattern="##,###.00" /></td>							     			  	  
					  	  </tr>
					  <tfoot>
					 
					  	  <tr class="table-primary">
						     <td>Rem Total</td>
						     <td>Base S.S.</td>
						     <td>Base A.T. y Des.</td>
						     <td>Base I.R.P.F.</td>
						     <td>Total Devengado</td>
						     <td>Total Deducciones</td>					  	  
					  	  </tr>
						  <tr style="text-align:center">
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos}"  pattern="##,###.00" /></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos}"  pattern="##,###.00" /></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos}"  pattern="##,###.00" /></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos}"  pattern="##,###.00" /></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${devengos}"  pattern="##,###.00" /></td>
						     <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${(deducciones + desc1 + desc2 + desc3)}"  pattern="##,###.00" /></td>

						  </tr>
					 </tfoot>
					</tbody>
				</table>
			  </c:if>
			</div>
		</div>
	</div>

</body>
</html>