var genApp=angular.module("attendanceApp", ['hSweetAlert']);
genApp.controller("attendanceCtr", function($scope, $http, sweet) {
	
	$scope.getDateToday = function() {
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1; //January is 0!

		var yyyy = today.getFullYear();
		if(dd<10){
		    dd='0'+dd
		} 
		if(mm<10){
		    mm='0'+mm
		} 
		return today = yyyy+'-'+mm+'-'+dd;
	};
	
	$scope.toDay=$scope.getDateToday();
	
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
			$scope.getStudentFromClass(cla_id, $scope.toDay);
		});
	}
	
	$scope.getClassByCourse = function(cou_id) {
		$http.get(host+"/rest/class/"+cou_id).then(function(response) {
			$scope.classes = response.data.DATA;
		});
	}
	
	$scope.getStudent = function() {
		$http.get(host+"/rest/student/not-enroll").then(function(response) {
			$scope.students = response.data.DATA;
			if($scope.students.length==0) $("#noNotEnroll").show();
			else $("#noNotEnroll").hide();
		});
	};
	
	$scope.getStudentFromClass = function(cla_id) {
		var thisDay=$("#att_date").val();
		$http.get(host+"/rest/student/student-attendance/"+cla_id+"/"+thisDay).then(function(response) {
			$scope.studentsEnroll = response.data.DATA;
		});
	};
	
	$scope.submitAttendance = function() {
		var attDate=$("#att_date").val();
		var attShift=$("#att_shift").val();
		var reason=$('input[name="reason[]"]').map(function(){return $(this).val();}).get();
		var stuId=$('input[name="stuId[]"]').map(function(){return $(this).val();}).get();
		var attCbb = $("input[name=cbbAtt]:checked").map(function () {return this.value;}).get();
		var roleId=$('input[name="roleId[]"]').map(function(){return $(this).val();}).get();
		for(var i=0; i<attCbb.length; i++){
			var roleId=$("input[name='roleId["+attCbb[i]+"]']:checked").val();
			var data={'STUID':stuId[attCbb[i]], 'ATTDATE':attDate, 'ATTSHIFT':attShift, 'ATTREASON':reason[attCbb[i]], 'ABSID':roleId};
			console.log(data);
			$http.post(host+"/rest/attendance", data);
		}
		$.Notification.notify('success','bottom left','ATTENDANCE', 'Attendance controller sucessfully!');
	};
	
	$scope.selectThemePhoto = function(photo) {
		if(photo==null) return photo='default-profile.png';
		else return photo;
	}
	
	$scope.fillGender = function(gender) {
		if(gender=='m') return gender=['male', '#000000'];
		else return gender=['female', '#c62828'];
	}
	
	$scope.backToNotEnroll = function(stu_id) {
		$http.delete(host+"/rest/student-enroll/"+stu_id).success(function(response) {
			$scope.getStudent();
			$scope.getStudentFromClass($scope.genIdNotFinish, $scope.classId);
		});
	};
	
	$scope.canEnroll=false;
	$("#noEnroll").hide();
	$scope.imgUrl=host+"/resources/static/images/avatars/thumbnails/";
	$scope.newClaName='Any Classroom';
	$scope.getGenerationNotFinish();
	$scope.getCourseNotFinish();
	$scope.getStudent();
	
});

$(document).ready(function(){
	//select all checkboxes
	$("#selecct_all").change(function(){
	    $(".checkbox").prop('checked', $(this).prop("checked")); 
	});

	//uncheck "select all"
	$('.checkbox').change(function(){
	    if(false == $(this).prop("checked")){
	        $("#selecct_all").prop('checked', $(this).prop("checked"));
	    }
	});
	
	$('#att_date').datepicker({
		autoclose: true,
		todayHighlight: true,
		format: 'yyyy-mm-dd'
	});
    
}); 