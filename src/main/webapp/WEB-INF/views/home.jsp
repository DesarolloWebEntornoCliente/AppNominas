<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="t"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ page session="false"%>
<html>
<head>
	<title>N o m i n  a s</title>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- BOOTSTRAP CSS -->


	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />">
	
	<link rel="stylesheet" href="<c:url value="/resources/fonts/OLD/font-awesome.css" />">
	<script src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
</head>
<body>

   <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Login</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        
  						<c:url value="/comprobarUsuario" var="valUsuario" />    						                        
                        <f:form id="loginform" class="form-horizontal" role="form" method="POST" action="${valUsuario}">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
							<f:input path="login" class="form-control mb-2 mr-sm-2 mb-sm-0" id="login" name="login" placeholder="Login" required="required" maxlength="10" />
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        
                                   <f:input path="password" type="password" class="form-control mb-2 mr-sm-2 mb-sm-0" id="contrasena" name="contrasena" placeholder="Contraseña" required="required" />

                                    </div>
                                
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Recordar
                                        </label>
                                      </div>
                                    </div>

                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls">
                                      <input type="submit" class="btn btn-success" value="Login"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            ¿Aún no tienes Cuenta? 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Registrase aqui
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </f:form>     

                        </div>                     
                    </div>  
        </div>
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title"><h4>Registrar</h4></div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()"><h5>Login</h5></a></div>
                        </div>  
                        <div class="panel-body" >
                        <c:url value="/registraUsuario" var="add"></c:url>
						<f:form action="${add }" commandName="usuario"  id="signupform" class="form-horizontal" role="form" >
                        
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                  
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Cuenta de Correo" required="required">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">Nombre</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Usuario</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="login" name="login" placeholder="Nombre de Usuario" required="required">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Contraseña</label>
                                    <div class="col-md-9">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required="required">
                                    </div>
                                </div>

                              <div class="form-group">
                                  <input type="hidden" class="form-control" id="tipo" name="tipo" value="1">
                                </div>
  
                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-signup" type="submit" class="btn btn-info"><i class="icon-hand-right"></i> Registrar</button>
                                    </div>
                                </div>
                                
                                <div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">
                                                                            
                                </div>
                                                                
                            </f:form>
                         </div>
                    </div>
         </div> 
    </div>


	<script src="<c:url value="/resources/js/jquery-3.2.1.slim.min.js" />"></script>
	<script src="<c:url value="/resources/js/popper.min.js" />"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>
