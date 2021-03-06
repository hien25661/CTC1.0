<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

     <!-- sweetalert -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <style>
        .div {
            margin-top: 100px;
        }

        .navbar {
            margin-bottom: 0;
            background-color: #f4511e;
            z-index: 9999;
            border: 0;
            font-size: 12px !important;
            line-height: 1.42857143 !important;
            letter-spacing: 4px;
            border-radius: 0;
            font-family: Montserrat, sans-serif;
        }

            .navbar li a, .navbar .navbar-brand {
                color: #fff !important;
            }

        .navbar-nav li a:hover, .navbar-nav li.active a {
            color: #f4511e !important;
            background-color: #fff !important;
        }

        .navbar-default .navbar-toggle {
            border-color: transparent;
            color: #fff !important;
        }
    </style>

</head>
<body ng-app="myApp" ng-controller="userCtrl" class="container">
    <div>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#myAccount">Account</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div>  
    <br/><br/><br/>
    <h3>Users</h3>
    <div class="form-group">
        <div class="col-md-10 col-sm-10 col-xs-10">          
            <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Enter search" ng-model="searchvalue" />
            <i class="glyphicon glyphicon-search form-control-feedback"></i>
            </div>
        </div>
        <c:if test="${role eq 'ROLE_ADMIN'}">
	        <div class="col-md-2 col-sm-2 col-xs-2">
	            <button class="btn btn-success" ng-click="editUser('new')"> <span class="glyphicon glyphicon-plus"></span> Create</button>
	        </div>
        </c:if>
        <br>
    </div>
    <form ng-hide="hideform">
        <div class="col-md-4 col-sm-4 col-xs-4">
            <label>First Name:</label>
            <input class="form-control" type="text" ng-model="firstName" placeholder="First Name">
            <br>
            <label>Last Name:</label>
            <input class="form-control" type="text" ng-model="lastName" placeholder="Last Name">
            <br>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4">
            <label>Unit:</label>
            <input class="form-control" type="text" ng-model="unit" placeholder="Unit">
            <br>
            <label>Position:</label>
            <input class="form-control" type="text" ng-model="position" placeholder="Position">
            <br>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-4">
            <label>Username:</label>
            <input class="form-control" type="text" ng-model="username" placeholder="Username">
            <br>
            <label>Password:</label>
            <input class="form-control" type="password" ng-model="password" placeholder="Password">
            <br>
        </div>
        <button class="btn btn-primary" ng-disabled="incomplete" 
        ng-click="createUser(firstName,lastName,unit,position,username,password)" ng-hide="!flag">&#10004; Create </button>
        <button class="btn btn-warning" ng-click="editUser('cancel')" ng-hide="!flag">
            <span aria-hidden="true"><strong>&times;</strong> Cancel</span>
        </button>
        <button class="btn btn-primary" ng-click="updateUser()" ng-hide="flag">&#10004; Update </button>
         <button class="btn btn-warning" ng-click="editUser('cancel')" ng-hide="flag">
            <span aria-hidden="true"><strong>&times;</strong> Cancel</span>
        </button>
        <span>{{errortext}}</span>
    </form><br>
        <table class="table">
            <tr>
            	<c:if test="${role eq 'ROLE_ADMIN'}">
					<th>Edit</th>
				</c:if>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Unit</th>
                <th>Position</th>
                <th>Username</th>
            </tr>
            <tr dir-paginate="user in users |itemsPerPage: 5| filter: searchvalue">
              	<c:if test="${role eq 'ROLE_ADMIN'}">
	                <td>
	                    <button class="btn btn-info" ng-click="ChooseUserToUpdate(user.id,user)">&#9998; Update</button>
	                    <button class="btn btn-danger" ng-click="removeItem(user.id)"><span class="glyphicon glyphicon-trash"></span> Delete</button>
	                </td>
                </c:if>
                <td>{{ user.firstName }}</td>
                <td>{{ user.lastName }}</td>
                <td>{{ user.unit }}</td>
                <td>{{ user.position }}</td>
                <td>{{ user.username }}</td>
               
            </tr>
           
        </table>
        <center>
             <dir-pagination-controls
                max-size='5'
                direction-links='true'
                boundary-links='true'>
            </dir-pagination-controls>
        </center>
        <br>
     
    </div>
            
    <script src="resources/Project/js/myUser.js"></script>
    <script src="resources/Project/js/dirPagination.js"></script>
</body>
</html>
