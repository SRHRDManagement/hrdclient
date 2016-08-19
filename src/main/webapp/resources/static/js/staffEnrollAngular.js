var genApp=angular.module("staffEnrollApp", ['hSweetAlert', 'ui.multiselect']);
genApp.controller("staffEnrollCtr", function($scope, $http, sweet) {
	
	$scope.getGenerationNotFinish = function() {
		$http.get(host+"/rest/generation/generation-not-finish").then(function(response) {
			$scope.generationNotFinish = response.data.DATA;
			$scope.generationNotFinishStatus = response.data.STATUS;
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
			$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
		});
	}
	
	$scope.getCourseNotFinish = function() {
		$http.get(host+"/rest/course/course-not-finish").then(function(response) {
			$scope.courseNotFinish = response.data.DATA;
			$scope.courseNotFinishStatus = response.data.STATUS;
			$scope.couIdNotFinish=$scope.courseNotFinish.COUID;
			$scope.getClassByCourse($scope.couIdNotFinish);
			$scope.couNameNotFinish=$scope.courseNotFinish.COUNAME;
		});
	}
	
	$scope.getClassById = function(cla_id) {
		$http.get(host+"/rest/class/get-class-by-id/"+cla_id).then(function(response) {
			$scope.clas = response.data.DATA;
			$("#noSelectClass").hide();
			$scope.classId=$scope.clas.CLAID;
			$scope.newClaName=$scope.clas.CLANAME;
			$scope.newClaDate=$scope.clas.CLADATE;
			$scope.getStudentFromClass($scope.genIdNotFinish, cla_id);
		});
	}
	
	$scope.getClassByCourse = function(cou_id) {
		$http.get(host+"/rest/class/"+cou_id).then(function(response) {
			$scope.classes = response.data.DATA;
		});
	}
	
	//remove
	$scope.getStudent = function() {
		$http.get(host+"/rest/student/not-enroll").then(function(response) {
			$scope.students = response.data.DATA;
			if($scope.students.length==0) $("#noNotEnroll").show();
			else $("#noNotEnroll").hide();
		});
	};
	
	//replace
	$scope.getStaff = function() {
		$http.get(host+"/rest/staff").then(function(response) {
			$scope.staffs = response.data.DATA;
			if($scope.students.length==0) $("#noNotEnroll").show();
			else $("#noNotEnroll").hide();
		});
	};
	
	//remove
	$scope.getStudentFromClass = function(gen_id, cla_id) {
		$http.get(host+"/rest/student/"+gen_id+"/"+cla_id).then(function(response) {
			$scope.studentsEnroll = response.data.DATA;
			if($scope.studentsEnroll.length<1) $("#noEnroll").show();
			else $("#noEnroll").hide();
		});
	};
	
	//remove
	$scope.enrollStudent = function() {
		var studentId = [];
		studentId = $("input[name=cbbEnroll]:checked").map(function () {return this.value;}).get().join(",");
		var arrStu = studentId.split(",");
		for(var i=0; i<arrStu.length; i++){
			var data={'CLAID':$scope.classId, 'STUID':arrStu[i]};
			$http.post(host+"/rest/student-enroll", data);
		}
		sweet.show({
			  title: "Wow! Enroll successully.",
			  text: "Congratulation, student has/have enroll to "+$scope.newClaName+" class",
			  type: "success",
			  confirmButtonColor: "#DD6B55",
			  closeOnConfirm: true,
			  html: false
			}, function(){
				$scope.getStudent();
				$scope.getStudentFromClass($scope.genIdNotFinish, $scope.classId);
				$.Notification.notify('success','bottom left','ENROLL STUDENT', 'Enroll student sucessfully!');
				return false
			});
	};
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#000000'];
		else return gender=['female', '#c62828'];
	}
	
	var studentEn=[];
	$scope.studentSelected = function(stu_id) {
		studentEn.push(stu_id);
	};
	
	//remove
	$scope.backToNotEnroll = function(stu_id) {
		$http.delete(host+"/rest/student-enroll/"+stu_id).success(function(response) {
			$scope.getStudent();
			$scope.getStudentFromClass($scope.genIdNotFinish, $scope.classId);
		});
	};
	
	$scope.getSubject = function() {
		$http.get(host+"/rest/subject").then(function(response) {
			$scope.subjects = response.data.DATA;
		});
	};
	
	$scope.setSelect = function() {
		console.log($scope.selectedSubjects);
	};
	
	$scope.enrollStaff = function() {
		var staff = {'CLAID':$scope.classId};
	};
	
	$scope.canEnroll=false;
	$("#noEnroll").hide();
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.newClaName='Any Classroom';
	$scope.getGenerationNotFinish();
	$scope.getCourseNotFinish();
	$scope.getStudent();
	$scope.getStaff();
	$scope.getSubject();
	
});
