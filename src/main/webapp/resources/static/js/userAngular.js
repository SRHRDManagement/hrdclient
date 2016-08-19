var uploadImgPath=host+"/resources/static/images/avatars/";
var genApp=angular.module("userApp", ['hSweetAlert', 'angularUtils.directives.dirPagination']);
genApp.controller("userCtr", function($scope, $http, sweet) {
	
	$scope.usrPassword='hrd12345';
	$scope.stuId=null;
	$scope.staId=null;
	
	$scope.getStaffInfo = function(sta_id) {
		$http.get(host+"/rest/staff/"+sta_id).then(function(response) {			
			$scope.aStaff = response.data.DATA;
			$scope.staId=$scope.aStaff.STAID;
			$scope.roleId='2';
			$scope.staFirstName=$scope.aStaff.STAFIRSTNAME;
			$scope.staLastName=$scope.aStaff.STALASTNAME;
			$scope.staGender=$scope.aStaff.STAGENDER;
			$scope.staPhone=$scope.aStaff.STAPHONE;
			$scope.staAvatar=$scope.aStaff.STAAVATAR;
			if($scope.staAvatar!=null) $('#sAvatar').attr('src', uploadImgPath+$scope.staAvatar);
			else $('#sAvatar').attr('src', uploadImgPath+'default-profile.png');
			
			$scope.firstname=$scope.staFirstName;
			$scope.lastname=$scope.staLastName;
			$scope.gender=$scope.staGender;
			$scope.phone=$scope.staPhone;
			$scope.photo=$scope.staAvatar;
			$("#rdStu").attr("disabled",true);
			$("#rdAdm").attr("disabled",false);
			$("#rdIns").attr("disabled",false);
		});
	};
	
	$scope.getStudentInfo = function(stu_id) {
		$http.get(host+"/rest/student/"+stu_id).then(function(response) {
			$scope.aStudent = response.data.DATA;
			$scope.stuId=$scope.aStudent.STUID;
			$scope.roleId='3';
			$scope.stuFirstName=$scope.aStudent.STUFIRSTNAME;
			$scope.stuLastName=$scope.aStudent.STULASTNAME;
			$scope.stuGender=$scope.aStudent.STUGENDER;
			$scope.stuPhone=$scope.aStudent.STUPHONE;
			$scope.stuAvatar=$scope.aStudent.STUAVATAR;
			if($scope.stuAvatar!=null) $('#sAvatar').attr('src', uploadImgPath+$scope.stuAvatar);
			else $('#sAvatar').attr('src', uploadImgPath+'default-profile.png');
			
			$scope.firstname=$scope.stuFirstName;
			$scope.lastname=$scope.stuLastName;
			$scope.gender=$scope.stuGender;
			$scope.phone=$scope.stuPhone;
			$scope.photo=$scope.stuAvatar;
			$("#rdStu").attr("disabled",false);
			$("#rdAdm").attr("disabled",true);
			$("#rdIns").attr("disabled",true);
		});
	};
	
	$scope.addUser = function() {
		if($scope.usrPassword==null) $scope.usrPassword='hrd12345';
		var userData={'EMAIL':$scope.usrEmail, 'PASSWORD':$scope.usrPassword, 'USRFIRSTNAME':$scope.firstname, 'USRLASTNAME':$scope.lastname, 'ROLE_ID':$scope.roleId, 'USRGENDER':$scope.gender, 'USRPHONE':$scope.phone, 'USRAVATAR':$scope.photo, 'USRSTATUS': true, 'STAID':$scope.staId, 'STUID':$scope.stuId};
		console.log(userData);
		$http.post(host+"/rest/user", userData).success(function(response) {
			$.Notification.notify('success','bottom left',$scope.firstname+' '+$scope.lastname, 'Register sucessfully!');
			$scope.usrEmail=null;
			$scope.stuId=null;
			$scope.staId=null;
			$scope.getUser();
			$scope.getStaffNotUser();
			$scope.getStudentsNotUser();
		});
	};
	
    $('#user-modal').on('hidden.bs.modal', function (e) {
		$scope.usrEmail=null;
		$scope.stuId=null;
		$scope.staId=null;
    });
	
	$scope.showAddStaff = function() {
		if($("#plusButton").val()=='plus') {
			$("#plusButton").val('minus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
		}else{
			$("#plusButton").val('plus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
		}
		$("#staff-layout").slideToggle();
	}
	
	$scope.getStaffNotUser = function() {
		$http.get(host+"/rest/staff/staffs-not-user").then(function(response) {
			$scope.staffs = response.data.DATA;
		});
	}
	
	$scope.getStudentsNotUser = function() {
		$http.get(host+"/rest/student/student-not-user").then(function(response) {
			$scope.students = response.data.DATA;
		});
	};
	
	$scope.getUser = function() {
		$http.get(host+"/rest/user/get-all-users").then(function(response) {
			$scope.users = response.data.DATA;
		});
	}
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#42a5f5'];
		else return gender=['female', '#c62828'];
	}
	
	$scope.selectThemeStatus = function(status) {
		if(status) return status=['btn-success', 'glyphicon glyphicon-ok'];
		else return status=['btn-danger', 'glyphicon glyphicon-ban-circle'];
	}
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.selectRoleTheme = function(role) {
		if(role==1) return roleTheme=['Admin', 'green'];
		else if(role==2) return roleTheme=['Instructor', 'red'];
		else return roleTheme=['Student', 'black'];
	};
	
	$("#staAvatar").change(function(){
		var formData = new FormData();
		formData.append('image',  $("#staAvatar")[0].files[0]);
     	$.ajax({
            url: "/rest/student/avatar",
            type:"POST",
         	enctype : 'multipart/form-data',
			data : formData ,
			cache: false,
			crossDomain: true,
			processData : false, // tell jQuery not to process the data
			contentType : false, // tell jQuery not to set contentType
  	        beforeSend: function(xhr) {
				xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
  	        },
            success: function(data) {
            	console.log(data);
            	$('#sAvatar').attr('src', uploadImgPath+data.ORIGINAL_IMAGE);
            	$scope.staAvatar=data.ORIGINAL_IMAGE;
            	$.Notification.notify('success','bottom left','PHOTO PROFILE', 'Have just uploaded completly!');
            },
         	error: function(data){
         		console.log(data);
			}
        });
	});
	
	$("#staUpAvatar").change(function(){
		var formData = new FormData();
		formData.append('image',  $("#staUpAvatar")[0].files[0]);
     	$.ajax({
            url: "/rest/student/avatar",
            type:"POST",
         	enctype : 'multipart/form-data',
			data : formData ,
			cache: false,
			crossDomain: true,
			processData : false, // tell jQuery not to process the data
			contentType : false, // tell jQuery not to set contentType
  	        beforeSend: function(xhr) {
				xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
  	        },
            success: function(data) {
            	console.log(data);
            	$('#sUpAvatar').attr('src', uploadImgPath+data.ORIGINAL_IMAGE);
            	$scope.staUpAvatar=data.ORIGINAL_IMAGE;
            	$.Notification.notify('success','bottom left','PHOTO PROFILE', 'Have just uploaded  for updated completly!');
            },
         	error: function(data){
         		console.log(data);
			}
        });
	});
	
	$scope.getUserById = function(usr_id) {
		$http.get(host+"/rest/user/"+usr_id).then(function(response) {
			$scope.aStaff = response.data.DATA;
			$scope.staUpId=$scope.aStaff.STAID;
			$scope.staUpFirstName=$scope.aStaff.STAFIRSTNAME;
			$scope.staUpLastName=$scope.aStaff.STALASTNAME;
			$scope.staUpGender=$scope.aStaff.STAGENDER;
			$scope.staUpPhone=$scope.aStaff.STAPHONE;
			$scope.staUpAvatar=$scope.aStaff.STAAVATAR;
			if($scope.staUpAvatar!=null) $('#sUpAvatar').attr('src', uploadImgPath+$scope.staUpAvatar);
			else $('#sUpAvatar').attr('src', uploadImgPath+'default-profile.png');
		});
	};
	
	$scope.updateUser = function() {
		var staUpPhone=$("#staUpPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
		var updateData={'STAID':$scope.staUpId, 'STAFIRSTNAME':$scope.staUpFirstName, 'STALASTNAME':$scope.staUpLastName, 'STAGENDER':$scope.staUpGender, 'STAPHONE':staUpPhone, 'STAAVATAR':$scope.staUpAvatar};
		//$http.put(host+"/rest/staff", updateData).success(function(response) {
		$http.put(host+"/rest/user", updateData).success(function(response) {
			$scope.getStaff();
			$.Notification.notify('success','bottom left','STAFF', 'Have just information of Staff completly!');
		});
	};
	
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.getUser();
	$scope.getStaffNotUser();
	$scope.getStudentsNotUser();
	
});

$(document).ready(function() {
	//TODO
} );
