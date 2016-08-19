//var host="http://192.168.178.144:8080";
////var host="http://localhost:8080";
var genApp=angular.module("studentListApp", ['hSweetAlert', 'angularUtils.directives.dirPagination']);
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
	
	$scope.getStudentById = function(stu_id) {
		$("#studentList").slideToggle(500);
		$("#updateView").slideToggle(1000);
		$http.get(host+"/rest/student/"+stu_id).then(function(response) {
			$scope.studentById = response.data.DATA;
			$scope.uStuId=$scope.studentById.STUID;
			$scope.uFirstName=$scope.studentById.STUFIRSTNAME;
			$scope.uLastName=$scope.studentById.STULASTNAME;
			$scope.uGender=$scope.studentById.STUGENDER;
			$scope.uPhone=$scope.studentById.STUPHONE;
			$scope.uDob=$scope.studentById.STUDOB;
			$scope.uAddress=$scope.studentById.STUADDRESS;
			$scope.uNationality=$scope.studentById.STUNATIONALITY;
			$scope.uSocailId=$scope.studentById.STUSOCIALID;
			
			var uploadImgPath=host+"/resources/static/images/avatars/";
			$scope.uAvatar=$scope.studentById.STUAVATAR;
			if($scope.uAvatar!=null) $('#sAvatar').attr('src', uploadImgPath+$scope.uAvatar);
			else $('#sAvatar').attr('src', uploadImgPath+'default-profile.png');
			
			$scope.uFatherName=$scope.studentById.STUFATHERNAME;
			$scope.uFatherPhone=$scope.studentById.STUFATHERPHONE;
			$scope.uFatherJob=$scope.studentById.STUFATHERJOB;
			$scope.uMotherName=$scope.studentById.STUMOTHERNAME;
			$scope.uMotherPhone=$scope.studentById.STUMOTHERPHONE;
			$scope.uMotherJob=$scope.studentById.STUMOTHERJOB;
		});
	};
	
	$scope.browseImage = function() {
		$('#uAvatar').click();
	};
	
	$("#uAvatar").change(function(){
		var formData = new FormData();
		var uploadImgPath=host+"/resources/static/images/avatars/";
		formData.append('image',  $("#uAvatar")[0].files[0]);
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
				//xhr.setRequestHeader('Authorization', 'basic aHJkOiFAI2hyZGFwaQ==');
  	        },
            success: function(data) {
            	console.log(data);
            	$('#sAvatar').attr('src', uploadImgPath+data.ORIGINAL_IMAGE);
            	$scope.uAvatar=data.ORIGINAL_IMAGE;
            },
         	error: function(data){
         		console.log(data);
			}
        });
	});
	
	$scope.backToStudentList = function() {
		$("#studentList").slideToggle(800);
		$("#updateView").slideToggle(400);
	};
	
	 $scope.updateStudent = function() {
		 
			var uPhone=$("#uPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
			var uFatherPhone=$("#uFatherPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
			var uMotherPhone=$("#uMotherPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ').replace('_','');
			var uNationality=$("#uNationality").val();
			var uDob=$("#uDob").val();
			var uAddress=$("#uAddress").val();

			var studentData={'STUID':$scope.uStuId, 'STUFIRSTNAME':$scope.uFirstName, 'STULASTNAME':$scope.uLastName, 'STUGENDER':$scope.uGender, 'STUPHONE':uPhone, 
					'STUDOB':uDob, 'STUADDRESS':uAddress, 'STUNATIONALITY':uNationality, 'STUSOCIALID':$scope.uSocailId, 'STUAVATAR':$scope.uAvatar,
			'STUFATHERNAME':$scope.uFatherName, 'STUFATHERPHONE':uFatherPhone, 'STUFATHERJOB':$scope.uFatherJob,
			'STUMOTHERNAME':$scope.uMotherName, 'STUMOTHERPHONE':uMotherPhone, 'STUMOTHERJOB':$scope.uMotherJob};
			
			$http.put(host+"/rest/student", studentData).success(function(response) {
				$scope.getStudents();
				sweet.show($scope.uLastName+' '+$scope.uFirstName, "updated successfully!");
				$.Notification.notify('custom','bottom left','STUDENT', 'Information of '+$scope.uLastName+' '+$scope.uFirstName+' was updated sucessfully!');
				$("#studentList").slideToggle(800);
				$("#updateView").slideToggle(400);
				$scope.uFirstName=null;
				$scopeuLastName=null;
				$scope.uGender=null;
				$scope.uPhone=null;
				$scope.uDob=null;
				$scope.uAddress=null;
				$scope.uNationality=null;
				$scope.uSocailId=null;
				$scope.uAvatar=null;
				$scope.uFatherName=null;
				$scope.uFatherPhone=null;
				$scope.uFatherJob=null;
				$scope.uMotherName=null;
				$scope.uMotherPhone=null;
				$scope.uMotherJob=null;
			});
		};
		
		$scope.fillGender = function(gender) {
			if(gender=='m') return gender=['Male', '#42a5f5'];
			else return gender=['Female', '#c62828'];
		}
		
		$scope.selectThemeStatus = function(status) {
			if(status=='active') return status=['btn-success', 'glyphicon glyphicon-ok'];
			else return status=['btn-danger', 'glyphicon glyphicon-ban-circle'];
		}
	
	
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.getGenerationNotFinish();
	$scope.getStudents();
	
});

$(document).ready(function() {
} );
