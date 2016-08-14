//var host="http://192.168.178.144:8080";
var host="http://localhost:8080";
var uploadImgPath=host+"/resources/static/images/avatars/";
var genApp=angular.module("staffListApp", ['hSweetAlert', 'angularUtils.directives.dirPagination']);
genApp.controller("staffListCtr", function($scope, $http, sweet) {
	
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
	
	$scope.getStaff = function() {
		$http.get(host+"/rest/staff").then(function(response) {
			$scope.staffs = response.data.DATA;
		});
	}
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#42a5f5'];
		else return gender=['female', '#c62828'];
	}
	
	$scope.selectThemeStatus = function(status) {
		if(status=='active') return status='btn-success';
		else return status='btn-inverse';
	}
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.addStaff = function() {
		var staInPhone=$("#staInPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
		var staffData={'STAFIRSTNAME':$scope.staInFirstName, 'STALASTNAME':$scope.staInLastName, 'STAGENDER':$scope.staInGender, 'STAPHONE':staInPhone, 'STAAVATAR':$scope.staAvatar, 'STASTATUS':'active'};
		$http.post(host+"/rest/staff", staffData).success(function(response) {
			$scope.getStaff();
			sweet.show($scope.staInLastName+' '+$scope.staInFirstName, "Get ready into the system, please feel free!");
			$.Notification.notify('success','bottom left','STAFF', 'New staff was inserted sucessfully!');
			$scope.staInFirstName=null;
			$scope.staInLastName=null;
			$scope.staInGender='m';
			$("#staInPhone").val('');
			$("#staAvatar").val('');	
			$('#sAvatar').attr('src', uploadImgPath+'default-profile.png');
		});
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
	
	$scope.getStaffById = function(sta_id) {
		$http.get(host+"/rest/staff/"+sta_id).then(function(response) {
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
	
	$scope.updateStaff = function() {
		var staUpPhone=$("#staUpPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
		var updateData={'STAID':$scope.staUpId, 'STAFIRSTNAME':$scope.staUpFirstName, 'STALASTNAME':$scope.staUpLastName, 'STAGENDER':$scope.staUpGender, 'STAPHONE':staUpPhone, 'STAAVATAR':$scope.staUpAvatar};
		//$http.put(host+"/rest/staff", updateData).success(function(response) {
		$http.put(host+"/rest/staff", updateData).success(function(response) {
			$scope.getStaff();
			$.Notification.notify('success','bottom left','STAFF', 'Have just information of Staff completly!');
		});
	};
	
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.getStaff();
	
});

$(document).ready(function() {
	//TODO
} );
