var genApp=angular.module("studentListApp", ['hSweetAlert']);
genApp.controller("studentListCtr", function($scope, $http, sweet) {
	
	$scope.getGenerationNotFinish = function() {
		$http.get("http://localhost:8080/rest/generation/generation-not-finish").then(function(response) {
			$scope.generationNotFinish = response.data.DATA;
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
			$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
		});
	};
	
	$scope.getStudents = function() {
		$http.get("http://localhost:8080/rest/student").then(function(response) {
			$scope.students = response.data.DATA;
		});
	};
	
	$scope.getGenerationNotFinish();
	$scope.getStudents();
	
});