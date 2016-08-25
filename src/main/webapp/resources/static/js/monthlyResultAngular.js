var genApp=angular.module("monthlyResultApp", ['hSweetAlert']);
genApp.controller("monthlyResultCtr", function($scope, $http, sweet) {
	
	$scope.getReport = function(mon_id) {
		$http.get(host+"/rest/score/report/"+mon_id).then(function(response) {
			$scope.reports = response.data.DATA;
		});
	}
	
	$scope.getCurrentMonth = function() {
		var d = new Date();
	    var n = d.getMonth();
	    return n;
	};
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#000000'];
		else return gender=['female', '#c62828'];
	}
	
	$scope.getReport($scope.getCurrentMonth()+1);
	
});