var genApp=angular.module("subjectApp", ['hSweetAlert']);
genApp.controller("subjectCtr", function($scope, $http, sweet) {
	
	$scope.getGeneration = function() {
		$http.get("http://localhost:8080/rest/generation").then(function(response) {
			$scope.generations = response.data.DATA;
			if(response.data.STATUS){
				//TODO
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
	
	$scope.getGeneration();
	
	$scope.getSubject = function() {
		$http.get("http://localhost:8080/rest/subject").then(function(response) {
			$scope.subjects = response.data.DATA;
			if(response.data.STATUS){
				$("#tblSubject").show();
				$("#subjectNotFound").hide();
			}else{
				$("#tblSubject").hide();
				$("#subjectNotFound").show();
			}
		});
	}
	
	$scope.getSubjectById = function(sub_id) {
		$http.get("http://localhost:8080/rest/subject/"+sub_id).then(function(response) {
			$scope.subject = response.data.DATA;
			$scope.subId=$scope.subject.SUBID;
			$scope.newSubName=$scope.subject.SUBNAME;
			$scope.newSubDate=$scope.subject.SUBDATE;
			$scope.newSubDesc=$scope.subject.SUBDESC;
			$scope.subAct=$scope.subject.SUBACTIVE;
		});
	}
	
	$scope.updateSubject = function() {
		var updateData={'SUBID':$scope.subId, 'SUBNAME':$scope.newSubName, 'SUBDATE':$scope.newSubDate, 'SUBDESC':$scope.newSubDesc};
		$http.put("http://localhost:8080/rest/subject", updateData).success(function(response) {
			$scope.getSubject();
			$.Notification.notify('custom','bottom left','SUBJECT', 'Subject was updated sucessfully!');
		})
	}
	
	$scope.showAddSubjectForm = function() {
		if($("#showAddSubjectButton").val()=='plus') {
			$("#showAddSubjectButton").val('minus');
			$("#showAddSubjectButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}else{
			$("#showAddSubjectButton").val('plus');
			$("#showAddSubjectButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
		}
		var date=new Date();
		var y=date.getUTCFullYear();
		var m=date.getMonth()+1;
		var d=date.getDate();
		$scope.subDate=y+'-'+m+'-'+d;
		$("#subject-layout").slideToggle();
	}
	
	$scope.addSubject = function() {
		var addData={'SUBNAME':$scope.subName, 'SUBDATE':$scope.subDate, 'SUBDESC':$scope.subDesc, 'SUBACTIVE':true};
		$http.post("http://localhost:8080/rest/subject", addData).success(function(response) {
			$scope.getSubject();
			$.Notification.notify('success','bottom left','SUBJECT', 'New subject was insert sucessfully!');
			$scope.subName=null;
			$scope.subDesc=null;
		});
	}
	
	$scope.selectTheme = function(theme) {
		if(theme) return subjectState=['btn-success', 'active', 'active', 'black'];
		else return subjectState=['btn-danger', 'disabled', 'not-active', 'grey'];
	}
	
	$scope.disableSubject = function(sub_id) {
		$scope.getSubjectById(sub_id);
		sweet.show({
			title: "Do you want to delete this subject?",
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
            	swal("Cancelled", "You not change the state of Subject :)", "error");
            	return false;
            }
    		var disableSubject={'SUBID':sub_id, 'SUBACTIVE':!$scope.subAct};
            $http.put("http://localhost:8080/rest/subject/delete", disableSubject).success(function(response) {
            	swal("SUCCESSFUL", "You change state of subject successfully! ", "success");
            	$scope.getSubject();
    			$.Notification.notify('warning','bottom left','SUBJECT', 'Change state of subject sucessfully!');
    		});
        });
	}
	
	$scope.getSubject();
	
});