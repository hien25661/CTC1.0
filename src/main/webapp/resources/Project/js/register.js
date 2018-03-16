var app = angular.module("loginApplication", []);
app.controller("loginController", function ($scope,$window,$http) {

	// $http.get("http://localhost:8080/project01/abc/").then( function(response) {
	// 	$scope.users = response.data;
	// });

	$scope.signUp = function() {

		var employee = {};
		employee.fname = $scope.fname;
		employee.lname = $scope.lname;
		employee.unit = $scope.unit;
		employee.pos = $scope.pos;
		employee.reUser = $scope.reUser;
		employee.rePass = $scope.rePass;
		employee.id = $scope.id +1;

		text = $('#regpass').val();
		regex = /^[a-zA-Z]+$/;

		if(!$scope.reUser || !$scope.rePass || !$scope.pos ||
			!$scope.fname || !$scope.lname || !$scope.unit ){
			swal("Error !!! input blank","", "error");

	}else if ($scope.rePass.length <8) {
		swal('Password is too short', 'please input at least 8 characters!',"warning");
	}else if (regex.test(text)) {
		swal('Password is too weak', 'please input at least 1 special characters!',"warning");
	}else { 
		$scope.flagerr = true;
		 var user = {
	           		firstName : $scope.fname,
	                   lastName : $scope.lname,
	                   unit : $scope.unit,
	                   position : $scope.pos,
	                   username : $scope.reUser,
	                   password : $scope.rePass,
	                   id: $scope.id

	           };
			  $http.post("http://localhost:8080/CTC/rest/register", user).then(
					function(response) {
						swal("Sign up success !!!","", "success").then(function () {
							// when click ok then redirect back
							$window.location.href = '/CTC/listUser';
						})
					}, function(response) {
						alert(response.data.status);
					});
			  
		$scope.fname="";
		$scope.lname="";
		$scope.reUser="";
		$scope.rePass="";
		$scope.unit="";
		$scope.pos="";
	// VONG LAP DE KIEM TRA PHAN TU TRUNG NHAU  
	
		// 	for(var i=0;i<$scope.users.length;i++){
		// 		if (fName == $scope.users[i].fName && lName == $scope.users[i].lName 
		// 			&& unit == $scope.users[i].unit && pos == $scope.users[i].pos &&
		// 			reUser == $scope.users[i].pos.reUser) {
		// 			$scope.flagerr = true;
		// 		break;
		// 	} else {
		// 		$scope.flagerr = false;
		// 	}
		// }

		// if ($scope.flagerr == true)
		// {
		// 	$scope.errortext = "The item is already in your table.";
		// }
		// else {
		// 	$scope.users.push(employee);
		// }
		
		

	}
}
});