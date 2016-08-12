//var host="http://192.168.178.144:8080";
var host="http://localhost:8080";
var genApp=angular.module("studentListApp", ['hSweetAlert']);
genApp.controller("studentListCtr", function($scope, $http, sweet) {
	
	$scope.getGenerationNotFinish = function() {
		$http.get(host+"/rest/generation/generation-not-finish").then(function(response) {
			$scope.generationNotFinish = response.data.DATA;
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
			$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
		});
	};
	
	$scope.getStudents = function() {
		$http.get(host+"/rest/student").then(function(response) {
			$scope.students = response.data.DATA;
		});
	};
	
	$scope.getGenerationNotFinish();
	$scope.getStudents();
	
});

$(document).ready(function() {
	confirm("sometext");
} );
