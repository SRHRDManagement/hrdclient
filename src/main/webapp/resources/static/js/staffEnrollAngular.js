var genApp=angular.module("staffEnrollApp", ['hSweetAlert', 'ui.multiselect', 'angularUtils.directives.dirPagination']);
genApp.controller("staffEnrollCtr", function($scope, $http, sweet) {
	
	$scope.deleteInstructor = function(sp_id) {
		sweet.show({
			title: "Are you sure?",
			  text: "You need to type 'agree' to confirm, or another word to cancel! Remember that after you confirm this operation, you can not undo it back!",
			  type: "input",
			  showCancelButton: true,
			  closeOnConfirm: false,
			  inputPlaceholder: "Type 'agree' to confirm ..."
        }, function(inputValue) {
            if(inputValue===false){
            	return false;
            }
            if(inputValue===""){
            	swal.showInputError("You must need to type 'agree' to confirm!");
                return false
            }
            if(inputValue!=='agree'){
            	swal("Cancelled", "You not change the state of Generation :)", "error");
            	return false;
            }
            $http.delete(host+"/rest/enroll-instructor/"+sp_id).success(function(response) {
            	swal("SUCCESSFUL", "You've just deleted the instructor successfully! ", "success");
            	$scope.getInstructor();
            	$scope.getStaff();
    			$.Notification.notify('warning','bottom left','GENERATION', 'Yes, now you can enroll new instructor into soical!');
    		});
        });
	};
	
	$scope.showAddStaff = function() {
		if($("#plusButton").val()=='plus') {
			$("#plusButton").val('minus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}else{
			$("#plusButton").val('plus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
		}
		$("#staff-layout").slideToggle();
	};
	
	$scope.getGenerations = function() {
		$http.get(host+"/rest/generation").then(function(response) {
			$scope.generations = response.data.DATA;
			$scope.newGenId=$scope.generations[$scope.generations.length-1].GENID;
			$scope.getCourseByGeneration($scope.newGenId);
		});
	}
	
	$scope.getGenerationNotFinish = function() {
		$http.get(host+"/rest/generation/generation-not-finish").then(function(response) {
			$scope.generationNotFinish = response.data.DATA;
			$scope.generationNotFinishStatus = response.data.STATUS;
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
			$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
			$scope.newGenName=$scope.generationNotFinish.GENNAME;
		});
	}
	
	$scope.getGenerationById = function(id) {
		$http.get(host+"/rest/generation/"+id).then(function(response) {
			$scope.genById = response.data.DATA;
			$scope.newGenId=$scope.genById.GENID;
			$scope.newGenName=$scope.genById.GENNAME;
			$scope.getInstructorByGeneration($scope.newGenId);
		});
	}
	
	$scope.getClassById = function(cla_id) {
		$http.get(host+"/rest/class/get-class-by-id/"+cla_id).then(function(response) {
			$scope.clas = response.data.DATA;
			$scope.getClassId=$scope.clas.CLAID;
			$scope.newClaName=$scope.clas.CLANAME;
			$scope.getStaff($scope.getClassId, $scope.getSubjectId);
		});
	}
	
	$scope.getCourseNotFinish = function() {
		$http.get(host+"/rest/course/course-not-finish").then(function(response) {
			$scope.courseNotFinish = response.data.DATA;
			$scope.couIdNotFinish=$scope.courseNotFinish.COUID;
			$scope.couNameNotFinish=$scope.courseNotFinish.COUNAME;
		});
	}
	
	$scope.getCourseByGeneration = function(gen_id) {
		$http.get(host+"/rest/course/"+gen_id).then(function(response) {
			$scope.courses = response.data.DATA;
			$scope.courseByGenId=$scope.courses[$scope.courses.length-1].COUID;
			$scope.getClassByCourse($scope.courseByGenId);
		});
	}
	
	$scope.getClassByCourse = function(cou_id) {
		$http.get(host+"/rest/class/"+cou_id).then(function(response) {
			$scope.classes = response.data.DATA;
			$scope.getClassId=$scope.classes[0].CLAID;
			$scope.newClaName=$scope.classes[0].CLANAME;
			$scope.getSubject();
			$scope.getInstructorByGeneration($scope.newGenId);
		});
	}
	
	$scope.getStaff = function(cla_id, sub_id) {
		$http.get(host+"/rest/staff/not-in-study-process/"+cla_id+"/"+sub_id).then(function(response) {
			$scope.staffs = response.data.DATA;
		});
	};
	
	$scope.addEnrollInstructor = function() {
		var data={'CLAID':$scope.getClassId, 'SUBID':$scope.getSubjectId, 'STAID':$scope.getInstructorId, 'GENID':$scope.genIdNotFinish, 'COUID':$scope.couIdNotFinish};
		console.log(data);
		$http.post(host+"/rest/enroll-instructor", data).success(function(response) {
			$scope.getInstructor();
			$scope.getStaff($scope.getClassId, $scope.getSubjectId);
			sweet.show("CONGRATULATIONS!", "This staff was enroll to become instructor successfully!");
		});
	};
	
	$scope.getInstructor = function() {
		$http.get(host+"/rest/enroll-instructor").then(function(response) {
			$scope.instructors = response.data.DATA;
			$scope.newGenName='All generation';
		});
	};
	
	$scope.getInstructorByGeneration = function(gen_id) {
		$http.get(host+"/rest/enroll-instructor/"+gen_id).then(function(response) {
			$scope.instructors = response.data.DATA;
		});
	};
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.getSubject = function() {
		$http.get(host+"/rest/subject").then(function(response) {
			$scope.subjects = response.data.DATA;
			$scope.getSubjectId=$scope.subjects[0].SUBID;
			$scope.newSubName=$scope.subjects[0].SUBNAME;
			$scope.getStaff($scope.getClassId, $scope.getSubjectId);
		});
	};
	
	$scope.getSubjectById = function(sub_id) {
		$http.get(host+"/rest/subject/"+sub_id).then(function(response) {
			$scope.subject = response.data.DATA;
			$scope.getSubjectId=sub_id;
			$scope.newSubName=$scope.subject.SUBNAME;
			$scope.getStaff($scope.getClassId, $scope.getSubjectId);
		});
	}
	
	$("#noEnroll").hide();
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.getGenerations();
	$scope.getGenerationNotFinish();
	$scope.getCourseNotFinish();
	
});
