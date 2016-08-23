var genApp=angular.module("scoreApp", ['hSweetAlert']);
genApp.controller("scoreCtr", function($scope, $http, sweet) {
	
	$scope.autoSelect = function(index) {
		$(".checkbox:eq("+(index+1)+")").prop('checked', true);
	}
	
	$scope.insertScore = function() {
		var scoreNumber=$('input[name="scoreNumber[]"]').map(function(){return $(this).val();}).get();
		var attScore = $("input[name=cbbScore]:checked").map(function () {return this.value;}).get();
		var stuId=$('input[name="stuId[]"]').map(function(){return $(this).val();}).get();
		var data=null;
		for(var i=0; i<attScore.length; i++){
			data={'SCOSCORE':scoreNumber[attScore[i]], 'STUID':stuId[attScore[i]], 'SUBID':$scope.xSubjectId, 'MONID':$scope.xMonthId};
			$http.put(host+"/rest/score", data);
		}
		$.Notification.notify('success','bottom left','SCORE', 'Score was inserted or update dynamicly and syncronize sucessfully!');
	}
	
	$scope.getAllMonths = function() {
		$http.get(host+"/rest/score/month").then(function(response) {
			$scope.months = response.data.DATA;
			$scope.xMonthId=$scope.months[$scope.getCurrentMonth()].MONID;
			$scope.curMonth=$scope.months[$scope.getCurrentMonth()].MONNAME;
			$scope.getCourseNotFinish();
		});
	};
	
	$scope.getMonthById = function(mon_id) {
		$http.get(host+"/rest/score/month/"+mon_id).then(function(response) {
			$scope.aMonth = response.data.DATA;
			$scope.xMonthId=$scope.aMonth.MONID;
			$scope.curMonth=$scope.aMonth.MONNAME;
			$scope.getStudentScore($scope.xMonthId, $scope.xClassId, $scope.xSubjectId);
		});
	};
	
	$scope.getCourseNotFinish = function() {
		$http.get(host+"/rest/course/course-not-finish").then(function(response) {
			$scope.courseNotFinish = response.data.DATA;
			$scope.couIdNotFinish=$scope.courseNotFinish.COUID;
			$scope.getAllClassesByCourseID($scope.couIdNotFinish);
		});
	}
	
	$scope.getAllClassesByCourseID = function(cou_id) {
		$http.get(host+"/rest/class/"+cou_id).then(function(response) {
			$scope.classes = response.data.DATA;
			$scope.xClassId=$scope.classes[0].CLAID;
			$scope.curClassName=$scope.classes[0].CLANAME;
			$scope.getSubjects();
		});
	};
	
	$scope.getClassById = function(cla_id) {
		$http.get(host+"/rest/class/get-class-by-id/"+cla_id).then(function(response) {
			$scope.clas = response.data.DATA;
			$scope.xClassId=$scope.clas.CLAID;
			$scope.curClassName=$scope.clas.CLANAME;
			$scope.getStudentScore($scope.xMonthId, $scope.xClassId, $scope.xSubjectId);
		});
	}
	
	$scope.getSubjects = function() {
		$http.get(host+"/rest/subject").then(function(response) {
			$scope.subjects = response.data.DATA;
			$scope.xSubjectId=$scope.subjects[0].SUBID;
			$scope.curSubjectName=$scope.subjects[0].SUBNAME;
			$scope.getStudentScore($scope.xMonthId, $scope.xClassId, $scope.xSubjectId);
		});
	}
	
	$scope.getSubjectById = function(sub_id) {
		$http.get(host+"/rest/subject/"+sub_id).then(function(response) {
			$scope.aSubject = response.data.DATA;
			$scope.xSubjectId=$scope.aSubject.SUBID;
			$scope.curSubjectName=$scope.aSubject.SUBNAME;
			$scope.getStudentScore($scope.xMonthId, $scope.xClassId, $scope.xSubjectId);
		});
	}
	
	$scope.getStudentScore = function(mon_id, cla_id, sub_id) {
		$http.get(host+"/rest/score/"+mon_id+"/"+cla_id+"/"+sub_id).then(function(response) {
			$scope.scores = response.data.DATA;
		});
	}
	
	$scope.getCurrentMonth = function() {
		var d = new Date();
	    var n = d.getMonth();
	    return n;
	};
	
	$scope.selectColorScore = function(score) {
		if(score>=75 && score<=100) return score='green';
		else if(score>=50 && score<75) return score='blue';
		else return score='red';
	}
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#000000'];
		else return gender=['female', '#c62828'];
	}
	
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.getAllMonths();
	
});

$(document).ready(function() {
		$(".numberOnly").keyup(function(){
			alert(34)
		});
})