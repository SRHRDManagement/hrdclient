var genApp=angular.module("courseApp", ['hSweetAlert']);
genApp.controller("courseCtr", function($scope, $http, sweet) {
	
	$scope.getGeneration = function() {
		$http.get(host+"/rest/generation").then(function(response) {
			$scope.generations = response.data.DATA;
			if(response.data.STATUS){
				$scope.getCourseByGeneration($scope.generations[$scope.generations.length-1].GENID);
				$scope.lastGenerationName=$scope.generations[$scope.generations.length-1].GENNAME;
				$scope.getGenerationNotFinish();
			}else {
				sweet.show({
					  title: "Do you have Generation?",
					  text: "You must create generation to start process!",
					  type: "warning",
					  confirmButtonColor: "#DD6B55",
					  closeOnConfirm: false,
					  html: false
					}, function(){
						window.location.href = "/generation/index";
					});
			}
		});
	}
	
	$scope.getGenerationNotFinish = function() {
		$http.get(host+"/rest/generation/generation-not-finish").then(function(response) {
			$scope.generationNotFinish = response.data.DATA;
			$scope.generationNotFinishStatus = response.data.STATUS;
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
		});
	}
	
	$scope.getCourseByGeneration = function(gen_id) {
		$http.get(host+"/rest/course/"+gen_id).then(function(response) {
			$scope.courses = response.data.DATA;
			$scope.currentGen = $scope.generations.map(function (item) {return item.GENID;}).indexOf(gen_id);
			if(response.data.STATUS){
				$("#courseNotFound").hide();
				$scope.getLastCourseByGeneration = $scope.courses[$scope.courses.length-1].COUNAME;
				$scope.disableAddCourseButton=!$scope.courses[$scope.courses.length-1].COUISFINISH;
			}else $("#courseNotFound").slideDown();
		});
	}
	
	$scope.addCourse = function() {
		var couData={'COUNAME':$scope.modCouName, 'COUSTARTDATE':$scope.modCouStartDate, 'COUENDDATE':$scope.modCouEndDate, 'GENID':$scope.genIdNotFinish, 'COUISFINISH':false};
		$http.post(host+"/rest/course", couData).success(function(response) {
			$scope.getCourseByGeneration($scope.genIdNotFinish);
			$.Notification.notify('success','bottom left','GENERATION', 'New course was create sucessfully!');
			$("#btnShowAddCourseView").val('plus');
			$("#btnShowAddCourseView").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
			$("#addCourse-layout").slideToggle();
			$scope.modCouName=null;
			$scope.modCouStartDate=null;
			$scope.modCouEndDate=null;
		});
	}
	
	$scope.getGeneration();
	$scope.showAddCourseForm = function() {
		if(!$scope.generationNotFinishStatus){
			sweet.show($scope.lastGenerationName.toUpperCase()+" was finished!", "This generation is completed, already. You can not create more course, please create the next generation!");
		}else if($scope.disableAddCourseButton){
			sweet.show($scope.getLastCourseByGeneration.toUpperCase()+" course of "+$scope.lastGenerationName.toUpperCase()+" is not finish!");
		}else{
			if($("#btnShowAddCourseView").val()=='plus') {	
				$("#btnShowAddCourseView").val('minus');
				$("#btnShowAddCourseView").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
			}else{
				$("#btnShowAddCourseView").val('plus');
				$("#btnShowAddCourseView").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
			}
			$("#addCourse-layout").slideToggle();
		}
	}
	
	$scope.getCourseById = function(cou_id) {
		$http.get(host+"/rest/course/get-course-by-id/"+cou_id).then(function(response) {
			$scope.courseById = response.data.DATA;
			$scope.couId=$scope.courseById.COUID;
			$scope.newCouName=$scope.courseById.COUNAME;
			$scope.newCouStartDate=$scope.courseById.COUSTARTDATE;
			$scope.newCouEndDate=$scope.courseById.COUENDDATE;
		});
	}
	
	$scope.updateCourse = function() {
		var updateData={'COUID':$scope.couId, 'COUNAME':$scope.newCouName, 'COUSTARTDATE':$scope.newCouStartDate, 'COUENDDATE':$scope.newCouEndDate};
		$http.put(host+"/rest/course", updateData).success(function(response) {
			$scope.getCourseByGeneration($scope.genIdNotFinish);
			$.Notification.notify('custom','bottom left','COURSE', 'New course was updated sucessfully!');
		});
	}
	
	$scope.disableCourse = function(id) {
		sweet.show({
			title: "Is this course finish?",
			  text: "You need to type 'yes agree' to confirm, or another word to cancel! Remember that after you confirm this operation, you can not enable it back!",
			  type: "input",
			  showCancelButton: true,
			  closeOnConfirm: false,
			  inputPlaceholder: "Type 'yes agree' to confirm ..."
        }, function(inputValue) {
            if(inputValue===false){
            	return false;
            }
            if(inputValue===""){
            	swal.showInputError("You must need to type 'yes agree' to confirm!");
                return false
            }
            if(inputValue!=='yes agree'){
            	swal("Cancelled", "You not change the state of Course :)", "error");
            	return false;
            }
    		var disableGen={'COUID':id, 'COUISFINISH':true};
            $http.put(host+"/rest/course/"+id, disableGen).success(function(response) {
            	swal("SUCCESSFUL", "You change state of course successfully! ", "success");
            	$scope.getCourseByGeneration($scope.generations[$scope.generations.length-1].GENID);
    			$.Notification.notify('warning','bottom left','COURSE', 'Change state of course sucessfully!');
    		});
        });		
	}	
	
	$scope.selectTheme = function(theme) {
		if(theme) return finishState=['rgba(50, 78, 107, 1)', 'not-active', 'fa fa-check'];
		else return finishState=['rgba(0, 152, 225, 1)', 'active', 'fa fa-times'];
	}
	
});