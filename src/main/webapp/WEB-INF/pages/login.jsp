<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >

<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <!-- font google -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">

    <!-- sweetalert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <!-- JQuery -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>


    <!-- CSS & Boostrap-->
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href="resources/Project/css/myStyle.css" />
    <link rel="stylesheet" href="resources/Project/css/style.css" />
    
    <!-- angular -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

    <style>
        div.span {
            text-align:left;
        }
    </style>
</head>

<body ng-app="loginApplication" ng-controller="loginController">
    <div class="container">
        <div class="col-md-4 col-md-offset-1 col-sm-6">
            <img src="resources/Project/image/fpt_software.png" height="80%" width="80%" style="margin-top:280px;" />
        </div>
        <div class="col-md-4 col-md-offset-2 col-sm-6">
            <!-- @ Start login box wrapper -->
            <!-- BAT DAU THEM VAO TU DONG NAY -->

            <div class="overbox" >
                <div class="material-button alt-2"><span class="shape"></span></div>

                <div class="title">REGISTER</div>

                <div class="col-md-6 col-sm-5 col-xs-5">

                    <div class="input">
                       <label for="regname">Username</label>
                       <input type="text" name="regname" id="regname" ng-model="reUser">
                       <span class="spin"></span>
                   </div>

                   <div class="input">
                       <label for="regpass">Password</label>
                       <input type="password" name="regpass" id="regpass" ng-model="rePass">
                       <span class="spin"></span>
                   </div>

                   <div class="input">
                       <label for="reFname">First name</label>
                       <input type="text" name="reFname" id="reFname" ng-model="fname">
                       <span class="spin"></span>
                   </div>

               </div>
               <div class="col-md-6 col-sm-5 col-xs-5">

                   <div class="input">
                       <label for="regLname">Last Name</label>
                       <input type="text" name="regLname" id="regLname" ng-model="lname">
                       <span class="spin"></span>
                   </div>

                   <div class="input">
                       <label for="reUnit">Unit</label>
                       <input type="text" name="reUnit" id="reUnit" ng-model="unit">
                       <span class="spin"></span>
                   </div>

                   <div class="input">
                       <label for="rePosition">Position</label>
                       <input type="text" name="rePosition" id="rePosition" ng-model="pos">
                       <span class="spin"></span>
                   </div>

               </div>
               <div class="button">
                   <button ng-click="signUp()"><span>Sign up</span></button>
               </div>

           </div>

           <!-- DEN DAY -->

           <div class="blmd-wrapp">
            <div class="blmd-container">
                <!-- @ Login form container -->
                <form action="login" class="clearfix" id="login-form" method="POST">
                    <h1 >Login</h1>
                    <img src="resources/Project/image/fpt_software.png" height="40%" width="40%" style="margin-left:20px;" />
                    <div class="col-md-12 col-sm-12 col-xs-12">
						<c:if test="${msg}">
								<div class="alert alert-danger">
									<p>${msg}</p>
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

<script src="resources/Project/js/register.js"></script>
<script  src="resources/Project/js/index.js"></script>
</body>
</html>