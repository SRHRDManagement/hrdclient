//var host="http://192.168.178.144:8080";
var host="http://localhost:8080";
var genApp=angular.module("studentApp", ['hSweetAlert']);
genApp.controller("studentCtr", function($scope, $http, sweet) {
	
	$scope.getGenerationNotFinish = function() {
		$http.get(host+"/rest/generation/generation-not-finish").then(function(response) {	
			if(response.data.STATUS){
				$scope.generationNotFinish = response.data.DATA;
				$scope.genIdNotFinish=$scope.generationNotFinish.GENID;
				$scope.genNameNotFinish=$scope.generationNotFinish.GENNAME;
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
	};
	
	$scope.getStudents = function() {
		$http.get(host+"/rest/student").then(function(response) {
			$scope.students = response.data.DATA;
		});
	};
	
	$scope.getGenerationNotFinish();
	$scope.getStudents();
	
	$scope.browseImage = function() {
		$('#iAvatar').click();
	};
	
	$("#iAvatar").change(function(){
			var formData = new FormData();
			var uploadImgPath=host+"/resources/static/images/avatars/";
			formData.append('image',  $("#iAvatar")[0].files[0]);
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
	            	$scope.iAvatar=data.ORIGINAL_IMAGE;
	            },
	         	error: function(data){
	         		console.log(data);
				}
	        });
		});
	
	 $scope.addStudent = function() {
		 
		var iPhone=$("#iPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ');
		var iFatherPhone=$("#iFatherPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ');
		var iMotherPhone=$("#iMotherPhone").val().replace('(', '').replace(')', '').replace('-', ' ').replace('-',' ');

		var studentData={'STUFIRSTNAME':$scope.iFirstName, 'STULASTNAME':$scope.iLastName, 'STUGENDER':$scope.iGender, 'STUPHONE':iPhone, 
				'STUDOB':$scope.iDob, 'STUADDRESS':$scope.iAddress, 'STUNATIONALITY':$scope.iNationality, 'STUSOCIALID':$scope.iSocailId, 'STUAVATAR':$scope.iAvatar,
				'STUSTATUS':"yes", 'GENID': $scope.genIdNotFinish,
		'STUFATHERNAME':$scope.iFatherName, 'STUFATHERPHONE':iFatherPhone, 'STUFATHERJOB':$scope.iFatherJob,
		'STUMOTHERNAME':$scope.iMotherName, 'STUMOTHERPHONE':iMotherPhone, 'STUMOTHERJOB':$scope.iMotherJob};
		
		$http.post(host+"/rest/student", studentData).success(function(response) {
			sweet.show($scope.iLastName+' '+$scope.iFirstName, "Get ready into the system!");
			$.Notification.notify('success','bottom left','STUDENT', 'New student was insert sucessfully!');
			$scope.iFirstName=null;
			$scope.iLastName=null;
			$scope.iGender=null;
			$scope.iPhone=null;
			$scope.iDob=null;
			$scope.iAddress=null;
			$scope.iNationality=null;
			$scope.iSocailId=null;
			$scope.iAvatar=null;
			$scope.genIdNotFinish=null;
			$scope.iFatherName=null;
			$scope.iFatherPhone=null;
			$scope.iFatherJob=null;
			$scope.iMotherName=null;
			$scope.iMotherPhone=null;
			$scope.iMotherJob=null;
		});
	};
	
});