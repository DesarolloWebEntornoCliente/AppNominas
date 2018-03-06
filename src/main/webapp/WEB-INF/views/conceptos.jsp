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
<title>Conceptos</title>
</head>
<body>
	<div class="container" style="background-color: ">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
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
							<f:input path="tipo" class="form-control"/>
						</div>	
						<c:choose>
							<c:when test="${!empty concepto.descripcion }">
								<input type="submit" value="<t:message code="" text="Editar Concepto" />" class="btn btn-info">
							</c:when>
							<c:otherwise>
								<input type="submit" value="<t:message code="" text="Añadir Concepto" />" class="btn btn-primary">
							</c:otherwise>
						</c:choose>
															
					</f:form>
				</div>
			</div>
		</div>
	</div>
	
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
				<c:if test="${!empty listConceptos }">
			
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Codigo</th>
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
								<td>${cp.idConcepto }</td>
								<td>${cp.descripcion }</td>
								<td>${cp.impuesto }</td>
								<td>${cp.tipo }</td>
								<td><a class="btn btn-info btn-xs" href='<c:url value="/edit/${cp.idConcepto }"></c:url>'>Edit</a></td>
								<td><a class="btn btn-danger btn-xs" href='<c:url value="/delete/${cp.idConcepto }"></c:url>'>Del</a></td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			  </c:if>
			</div>
		</div>
	</div>


</body>
</html>