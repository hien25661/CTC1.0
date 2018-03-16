<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- angular -->
	    <script src="resources/Project/js/validate.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  
	
	    <!-- CSS & Boostrap-->
	    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
	    <link rel="stylesheet" href="resources/Project/css/style.css" />
	    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    </head>
    
    <body ng-app="loginApplication" ng-controller="loginController">
    <div class="container">
        <div class="col-md-4 col-md-offset-6 col-xs-12">
            <!-- @ Start login box wrapper -->
            <div class="blmd-wrapp">
                <div class="blmd-container">
                    <!-- @ Login form container -->
                    <form class="clearfix" id="login-form" method="POST">
                        <h1 >Login</h1>
                        <img src="resources/Project/image/fpt_software.png" height="40%" width="40%" style="margin-left:20px;" />
                        <div class="col-md-12 col-sm-12 col-xs-12">
							<c:if test="${error != null}">
								<div class="alert alert-danger">
									<p>Invalid username and password</p>
								</div>
							</c:if>
							<c:if test="${logout != null}">
								<div class="alert alert-danger">
									<p>You have been logged out successfully</p>
								</div>
							</c:if>
							<div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="text" name="username" autocomplete="off" id="username" class="form-control" ng-model="username" required>
                                    <label class="blmd-label">Username</label>
                                </div>
                            </div>
                            <div class="input-group blmd-form">
                                <div class="blmd-line">
                                    <input type="password" name="password" autocomplete="off" id="password" class="form-control" ng-model="password" required>
                                    <label class="blmd-label">Password</label>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="col-sm-12 text-center">
                            <button type="submit" class="btn btn-blmd ripple-effect btn-success btn-lg btn-block">Login</button>
                        </div>
                        <br/>
                        <div class="col-sm-12 text-center">
                            <p style="font-size:12px; margin-top:15px;">Credit by C106_HCM_FR_JAVA</p>
                        </div>   
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- JQuery -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <script  src="resources/Project/js/index.js"></script>
</body>
</html>