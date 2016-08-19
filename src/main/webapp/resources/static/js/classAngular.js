var genApp=angular.module("classApp", ['hSweetAlert']);
genApp.controller("classCtr", function($scope, $http, sweet) {
	
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
			$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
			$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
		});
	}
	
	$scope.getCourseByGeneration = function(gen_id) {
		$http.get(host+"/rest/course/"+gen_id).then(function(response) {
			$scope.courses = response.data.DATA;
			if(response.data.STATUS){
				$scope.getCourseNotFinish();
				$scope.getClassByCourse($scope.courses[$scope.courses.length-1].COUID);
				$scope.lastCourseId=$scope.courses[$scope.courses.length-1].COUID;
				$scope.lastCourseName=$scope.courses[$scope.courses.length-1].COUNAME;
				$scope.currentGen = $scope.generations.map(function (item) {return item.GENID;}).indexOf(gen_id);
			}else{
				if($scope.courses==undefined){
					sweet.show({
						  title: "Do you have Course?",
						  text: "You must create course to start process!",
						  type: "warning",
						  confirmButtonColor: "#DD6B55",
						  closeOnConfirm: false,
						  html: false
						}, function(){
							window.location.href = "/course/index";
					});
				}else{
					$scope.getCourseByGeneration($scope.generations[$scope.generations.length-2].GENID);
					sweet.show("No course in "+$scope.lastGenerationName+"!");
				}
			}
		});
	}
	
	$scope.getClassByCourse = function(cou_id) {
		$http.get(host+"/rest/class/"+cou_id).then(function(response) {
			$scope.classes = response.data.DATA;
			$scope.currentCou = $scope.courses.map(function (item) {return item.COUID;}).indexOf(cou_id);
			if(response.data.STATUS){
				$("#courseNotFound").hide();
				$scope.getLastClassByCourse = $scope.classes[$scope.classes.length-1].CLANAME;
				$scope.disableAddClassButton=!$scope.classes[$scope.classes.length-1].CLAISFINISH;
			}else $("#courseNotFound").slideDown();
		});
	}
	
	$scope.getCourseNotFinish = function() {
		$http.get(host+"/rest/course/course-not-finish").then(function(response) {
			$scope.courseNotFinish = response.data.DATA;
			$scope.courseNotFinishStatus = response.data.STATUS;
			$scope.couIdNotFinish=$scope.courseNotFinish.COUID;
		});
	}
	
	$scope.showAddClassForm = function() {
		if(!$scope.courseNotFinishStatus){
			sweet.show($scope.lastCourseName.toUpperCase()+" Course was finished!", "You must create new course to add class in it!");
		}else{
			if($("#addClassButton").val()=='plus') {
			$("#addClassButton").val('minus');
			$("#addClassButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}else{
			$("#addClassButton").val('plus');
			$("#addClassButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
			}
			$("#addClass-layout").slideToggle();
		}
		var date=new Date();
		var y=date.getUTCFullYear();
		var m=date.getMonth()+1;
		var d=date.getDate();
		$scope.classInsertDate=y+'-'+m+'-'+d;
	}
	
	$scope.addClassRoom = function() {
		var classData={'CLANAME':$scope.addClassName, 'CLADATE':$scope.classInsertDate, 'COUID':$scope.couIdNotFinish, 'CLAACTIVE':true};
		$http.post(host+"/rest/class", classData).success(function(response) {
			$scope.getClassByCourse($scope.courses[$scope.courses.length-1].COUID);
			$.Notification.notify('success','bottom left','GENERATION', 'New classroom was insert sucessfully!');
			$scope.addClassName=null;
		});
	}
	
	$scope.getClassById = function(cla_id) {
		$http.get(host+"/rest/class/get-class-by-id/"+cla_id).then(function(response) {
			$scope.clas = response.data.DATA;
			$scope.classId=$scope.clas.CLAID;
			$scope.newClaName=$scope.clas.CLANAME;
			$scope.newClaDate=$scope.clas.CLADATE;
		});
	}
	
	$scope.updateClass = function() {
		var updateData={'CLAID':$scope.classId, 'CLANAME':$scope.newClaName, 'CLADATE':$scope.newClaDate};
		$http.put(host+"/rest/class", updateData).success(function(response) {
			$scope.getClassByCourse($scope.courses[$scope.courses.length-1].COUID);
			$.Notification.notify('custom','bottom left','CLASS', 'Class was updated sucessfully!');
		})
	}
	
	$scope.disableClass = function(cla_id) {
		sweet.show({
			title: "Do this class finish?",
			  text: "You need to type 'agree' to confirm, or another word to cancel! Remember that after you confirm this operation, you can not enable it back!",
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
            	swal("Cancelled", "You not change the state of Class :)", "error");
            	return false;
            }
    		var disableClass={'CLAID':cla_id, 'CLAACTIVE':false};
            $http.put(host+"/rest/class/"+cla_id, disableClass).success(function(response) {
            	swal("SUCCESSFUL", "You change state of class successfully! ", "success");
            	$scope.getClassByCourse($scope.courses[$scope.courses.length-1].COUID);
    			$.Notification.notify('warning','bottom left','CLASS', 'Change state of class sucessfully!');
    		});
        });
	}
	
	$scope.selectTheme = function(theme) {
		if(!theme) return finishState=['rgba(50, 78, 107, 1)', 'not-active', 'fa fa-check'];
		else return finishState=['rgba(0, 152, 225, 1)', 'active', 'fa fa-times'];
	}
	
	//call propery
	$scope.getGeneration();
	
});