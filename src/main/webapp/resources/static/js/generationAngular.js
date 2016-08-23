var genApp=angular.module("generationApp", ['hSweetAlert']);
genApp.controller("generationCtr", function($scope, $http, sweet) {
	$scope.getGeneration = function() {
		$http.get(host+"/rest/generation").then(function(response) {
			$scope.generations = response.data.DATA;
			if(response.data.STATUS){
				$("#courseNotFound").hide();
				$scope.disableAddGenerationButton=!$scope.generations[$scope.generations.length-1].GENISFINISH;
				$scope.lastGenerationName=$scope.generations[$scope.generations.length-1].GENNAME;
			}else $("#courseNotFound").slideDown();
		});
	}
	$scope.getGeneration();
	
	$scope.addGeneration = function() {
		var genData={'GENNAME':$scope.txtGenName, 'GENSTARTDATE':$scope.txtStartDate, 'GENENDDATE':$scope.txtEndDate};
		$http.post(host+"/rest/generation", genData).success(function(response) {
			$scope.getGeneration();	
			$.Notification.notify('success','bottom left','GENERATION', 'New generation was insert sucessfully!');
			$("#plusButton").val('plus');
			$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
			$("#generation-layout").slideToggle();
			$scope.txtGenName=null;
			$scope.txtStartDate=null;
			$scope.txtEndDate=null;
		});
	}
	
	$scope.getGenerationById = function(id) {
		$http.get(host+"/rest/generation/"+id).then(function(response) {
			$scope.genById = response.data.DATA;
			$scope.genId=$scope.genById.GENID;
			$scope.newGenName=$scope.genById.GENNAME;
			$scope.newGenStartDate=$scope.genById.GENSTARTDATE;
			$scope.newGenEndDate=$scope.genById.GENENDDATE;
		});
	}
	
	$scope.updateGeneration = function() {
		var updateData={'GENID':$scope.genId, 'GENNAME':$scope.newGenName, 'GENSTARTDATE':$scope.newGenStartDate, 'GENENDDATE':$scope.newGenEndDate};
		$http.put(host+"/rest/generation", updateData).success(function(response) {
			$scope.getGeneration();	
			$.Notification.notify('custom','bottom left','GENERATION', 'New generation was updated sucessfully!');
		});
	}
	
	$scope.selectTheme = function(theme) {
		if(theme) return finishState=['bg-inverse', 'not-active', 'md-check'];
		else return finishState=['bg-primary', 'active', 'md-close'];
	}
	
	$scope.showAddGeneration = function() {
		if($scope.disableAddGenerationButton){
			sweet.show($scope.lastGenerationName.toUpperCase()+" is not finish!");
		}else{
			if($("#plusButton").val()=='plus') {
				$("#plusButton").val('minus');
				$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-minus-sign"></i>');
			}else{
				$("#plusButton").val('plus');
				$("#plusButton").html('<i id="plusicon" class="glyphicon glyphicon-plus-sign"></i>');
			}
			$("#generation-layout").slideToggle();
		}
	}
	
	$scope.disableGeneration = function(id) {
		sweet.show({
			title: "Is this generation finish?",
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
            	swal.showInputError("You must need to type 'yes agree' to confirm!");
                return false
            }
            if(inputValue!=='agree'){
            	swal("Cancelled", "You not change the state of Generation :)", "error");
            	return false;
            }
    		var disableGen={'GENID':id, 'GENISFINISH':true};
            $http.put(host+"/rest/generation/"+id, disableGen).success(function(response) {
            	swal("SUCCESSFUL", "You change state of generation successfully! ", "success");
    			$scope.getGeneration();	
    			$.Notification.notify('warning','bottom left','GENERATION', 'Change state of generation sucessfully!');
    		});
        });		
	}	
	
});