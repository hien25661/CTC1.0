<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<body ng-app="myApp" ng-controller="userCtrl" class="container">

    <div >  

        <h3>Users</h3>
    <div class="form-group">
        <div class="col-md-9 col-sm-9 col-xs-9">          
            <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Enter search" ng-model="searchvalue" />
            <i class="glyphicon glyphicon-search form-control-feedback"></i>
            </div>
        </div>
        <div class="col-md-2 col-sm-2 col-xs-2">
            <button class="btn btn-success" ng-click="editUser('new')"> <span class="glyphicon glyphicon-plus"></span> Create</button>
        </div>
        <br>
    </div>
    <form ng-hide="hideform">
        <div class="col-md-4 col-sm-3 col-xs-4">
            <label>First Name:</label>
            <input class="form-control" type="text" ng-model="fName" placeholder="First Name">
            <br>
            <label>Last Name:</label>
            <input class="form-control" type="text" ng-model="lName" placeholder="Last Name">
            <br>
        </div>
        <div class="col-md-4 col-sm-3 col-xs-4">
            <label>Unit:</label>
            <input class="form-control" type="text" ng-model="unit" placeholder="Unit">
            <br>
            <label>Position:</label>
            <input class="form-control" type="text" ng-model="pos" placeholder="Position">
            <br>
        </div>
        <div class="col-md-4 col-sm-3 col-xs-4">
            <label>Password:</label>
            <input class="form-control" type="password" ng-model="passw1" placeholder="Password">
            <br>
            <label>Repeat:</label>
            <input class="form-control" type="password" ng-model="passw2" placeholder="Repeat Password">
            <br>
        </div>
        <button class="btn btn-primary" ng-disabled="error || incomplete" ng-click="createUser(fName,lName,unit,pos)" ng-hide="!flag">&#10004; Create </button>
        <button class="btn btn-warning" ng-click="editUser('cancel')">
            <span aria-hidden="true"><strong>&times;</strong> Cancel</span>
        </button>
        <button class="btn btn-primary" ng-click="updateUser()" ng-hide="flag">&#10004; Update </button>
        <span>{{errortext}}</span>
    </form><br>
        <table class="table">
            <tr>
                <th>Edit</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Unit</th>
                <th>Position</th>
            </tr>
            <tr dir-paginate="user in users |itemsPerPage: 5| filter: searchvalue">
                <td>
                    <button class="btn btn-info" ng-click="ChooseUserToUpdate(user.id,$index)">&#9998; Update</button>
                    <button class="btn btn-danger" ng-click="removeItem($index)"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                </td>
                <td>{{ user.firstName }}</td>
                <td>{{ user.lastName }}</td>
                <td>{{ user.unit }}</td>
                <td>{{ user.possition }}</td>
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
