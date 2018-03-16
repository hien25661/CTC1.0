angular.module('myApp', ['angularUtils.directives.dirPagination']).controller('userCtrl', function ($scope,$http) {
    $scope.fName = '';
    $scope.lName = '';
    $scope.unit = '';
    $scope.pos = '';
    $scope.passw1 = '';
    $scope.passw2 = '';
    $http.get("http://localhost:8080/Security/abc/").then( function(response) {
        $scope.users = response.data;
     });
    
    $scope.error = false; 
    $scope.incomplete = false;
    $scope.hideform = true;
    $scope.editUser = function (id,index) {
        $scope.hideform = false;
        
        if (id == 'new') {
            $scope.incomplete = true;
            $scope.flag = true;
            $scope.fName = '';
            $scope.lName = '';
            $scope.unit = '';
            $scope.pos = '';
        } else if (id == 'cancel') {
            $scope.hideform = true;
        } else {
            $scope.flag = false;
            $scope.incomplete = false;
            $scope.fName = $scope.users[id - 1].fName;
            $scope.lName = $scope.users[id - 1].lName;
            $scope.unit = $scope.users[id - 1].unit;
            $scope.pos = $scope.users[id - 1].pos;

        }
    };
    
    $scope.$watch('passw1', function () { $scope.test(); });
    $scope.$watch('passw2', function () { $scope.test(); });
    $scope.$watch('fName', function () { $scope.test(); });
    $scope.$watch('lName', function () { $scope.test(); });
    $scope.$watch('unit', function () { $scope.test(); });
    $scope.$watch('pos', function () { $scope.test(); });

    $scope.test = function () {
        if ($scope.passw1 !== $scope.passw2) {
            $scope.error = true;
        } else {
            $scope.error = false;
        }
        $scope.incomplete = false;
        if ($scope.edit && (!$scope.fName.length ||
        !$scope.lName.length || !$scope.unit.length || !$scope.pos.length ||
        !$scope.passw1.length || !$scope.passw2.length)) {
            $scope.incomplete = true;
        }
    };
    $scope.removeItem = function(x){
        $scope.users.splice(x,1);
    }
    $scope.createUser = function(fName,lName,unit,pos){
        $scope.errortext ='';
        $scope.flagerr = true;
        var user = {
	        	firstName : $scope.fName,
	            lastName : $scope.lName,
	            unit : $scope.unit,
	            possition : $scope.pos
        };
        $http.post("http://localhost:8080/Security/abc/",user).then( function(response) {
            $scope.users = response.data;
         });
//        employee.fName = $scope.fName;
//        employee.lName = $scope.lName;
//        employee.unit = $scope.unit;
//        employee.pos = $scope.pos;
//        employee.id = $scope.id +1;
//         if (!$scope.fName || !$scope.lName || !$scope.unit || !$scope.pos ) {
//            $scope.errortext="Error!!! input blank";
//           
//        } else {   
//            for(var i=0;i<$scope.users.length;i++){
//                if(fName == $scope.users[i].fName && lName == $scope.users[i].lName && unit == $scope.users[i].unit && pos == $scope.users[i].pos ){
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
    }

    $scope.ChooseUserToUpdate = function(id,index){
         $scope.hideform = false;
        if (id == 'new') {
            $scope.incomplete = true;
            $scope.flag = true;
            $scope.fName = '';
            $scope.lName = '';
            $scope.unit = '';
            $scope.pos = '';
        } else {
            $scope.flag = false;
            $scope.fName = $scope.users[id - 1].fName;
            $scope.lName = $scope.users[id - 1].lName;
            $scope.unit = $scope.users[id - 1].unit;
            $scope.pos = $scope.users[id - 1].pos;

        }
       $scope.updateUser = function(){
        $scope.errortext ='';
        var employee = {};
        employee.fName = $scope.fName;
        employee.lName = $scope.lName;
        employee.unit = $scope.unit;
        employee.pos = $scope.pos;
        employee.id = $scope.id +1;
        if (!$scope.fName || !$scope.lName || !$scope.unit || !$scope.pos ) {
            $scope.errortext="Error!!! input blank";
           
        }else{
            $scope.users.splice(index,1,employee);
        }
       }
        
    } 


});
