angular.module('myApp', ['angularUtils.directives.dirPagination']).controller('userCtrl', function ($scope,$http,$timeout) {
    $scope.firstName = '';
    $scope.lastName = '';
    $scope.unit = '';
    $scope.position = '';
    $scope.username = '';
    $scope.password = '';
    $http.get("http://localhost:8080/CTC/rest/").then( function(response) {
        $scope.users = response.data;
     });
    
    $scope.incomplete = false;
    $scope.hideform = true;
    $scope.editUser = function (id,index) {
        $scope.hideform = false;
        
        if (id == 'new') {
            $scope.incomplete = true;
            $scope.flag = true;
            $scope.firstName = '';
            $scope.lastName = '';
            $scope.unit = '';
            $scope.position = '';
            $scope.username = '';
            $scope.password = '';
        } else if (id == 'cancel') {
            $scope.hideform = true;
        } else {
            $scope.flag = false;
            $scope.incomplete = false;
            $scope.firstName = $scope.users[id - 1].firstName;
            $scope.lastName = $scope.users[id - 1].lastName;
            $scope.unit = $scope.users[id - 1].unit;
            $scope.position = $scope.users[id - 1].position;
            $scope.username = $scope.users[id - 1].username;
            $scope.password = $scope.users[id - 1].password;

        }
    };
    
    $scope.$watch('username', function () { $scope.test(); });
    $scope.$watch('password', function () { $scope.test(); });
    $scope.$watch('firstName', function () { $scope.test(); });
    $scope.$watch('lastName', function () { $scope.test(); });
    $scope.$watch('unit', function () { $scope.test(); });
    $scope.$watch('position', function () { $scope.test(); });

    // Condition
    $scope.test = function () {
       
        $scope.incomplete = false;
        if (!$scope.firstName.length ||
        !$scope.lastName.length || !$scope.unit.length || !$scope.position.length ||
        !$scope.username.length || !$scope.password.length) {
            $scope.incomplete = true;
        }
    };

    $scope.removeItem = function(x){
//        $scope.users.splice($scope.users.indexOf(x),1);
        $http.delete("http://localhost:8080/CTC/rest/"+x)
        	.then( 
        			function(response) {
        				//success
    					$scope.users.splice($scope.users.indexOf(x),1);
//    					alert(response.data.message);
                        swal("Delete success","", "success");
        			},
        			function(response){
        				//fail
        				alert(response.data.status);
        			}
    			 );
    }
    $scope.createUser = function(){
        $scope.errortext ='';
//        $scope.flagerr = true;
        var user = {
        		firstName : $scope.firstName,
                lastName : $scope.lastName,
                unit : $scope.unit,
                position : $scope.position,
                username : $scope.username,
                password : $scope.password

        };
        //         if (!$scope.firstName || !$scope.lastName || !$scope.unit || !$scope.position  || !$scope.username || !$scope.password) {
//            $scope.errortext="Error!!! input blank";
//           
//        } else {   
//            for(var i=0;i<$scope.users.length;i++){
//                if (firstName == $scope.users[i].firstName && lastName == $scope.users[i].lastName 
//                    && unit == $scope.users[i].unit && position == $scope.users[i].position 
//                    && username == $scope.users[i].username) {
//                    $scope.flagerr = true;
//                    break;
//                } else {
//                    $scope.flagerr = false;
//                }
//            }
//                if ($scope.flagerr == true)
//                {
//                    $scope.errortext = "The item is already in your table.";
//                }
//                else {
//                    $scope.users.push(employee);
//                }
//           
//        }

        $http.post("http://localhost:8080/CTC/rest/",user)
        	.then( 
        			function(response) {
				        	$scope.users.push(response.data);
//				        	alert(response.data.message);
                             swal("Create user success","", "success");
    					},
    				function(response){
        					alert(response.data.status);
        				}
        			);
    }

    $scope.ChooseUserToUpdate = function(id,x){
         $scope.hideform = false;
        if (id == 'new') {
            $scope.incomplete = true;
            $scope.flag = true;
            $scope.firstName = '';
            $scope.lastName = '';
            $scope.unit = '';
            $scope.position = '';
            $scope.username = '';
            $scope.password = '';
        } else {
            $scope.flag = false;
        }
        for(var i =0;i<$scope.users.length;i++){
        	if(id == $scope.users[i].id){
            $scope.firstName = $scope.users[i].firstName;
            $scope.lastName = $scope.users[i].lastName;
            $scope.unit = $scope.users[i].unit;
            $scope.position = $scope.users[i].position;
            $scope.username = $scope.users[i].username;
            $scope.password = $scope.users[i].password;
            $scope.id = $scope.users[i].id;
            break;
        	}
        }
        
       $scope.updateUser = function(){
    	   var user = {
           		firstName : $scope.firstName,
                   lastName : $scope.lastName,
                   unit : $scope.unit,
                   position : $scope.position,
                   username : $scope.username,
                   password : $scope.password,
                   id: $scope.id

           };
	        $scope.errortext ='';
	        $http.put("http://localhost:8080/CTC/rest/",user)
	        	.then( 
	        			function(response) {
	        				//success
	    					$scope.users.splice($scope.users.indexOf(x),1,response.data);
//	    					alert(response.data.message);
                             swal("Update success","", "success");
                             $timeout(function(){
                                 $scope.hideform = true;
                             },500);
	        			},
	        			function(response){
	        				//fail
	        				alert(response.data.status);
	        			}
        			);
//        var employee = {};
//        employee.firstName = $scope.firstName;
//        employee.lastName = $scope.lastName;
//        employee.unit = $scope.unit;
//        employee.position = $scope.position;
//        employee.username = $scope.username;
//        employee.password = $scope.password;
//        if (!$scope.firstName || !$scope.lastName || !$scope.unit 
//            || !$scope.position ||!$scope.username) {
//            $scope.errortext="Error!!! input blank";
//           
//        }else{
//            $scope.users.splice($scope.users.indexOf(x),1,employee);
//        }
       }
        
    } 


});
