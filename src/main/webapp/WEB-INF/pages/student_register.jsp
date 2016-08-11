<jsp:include page="header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/static/js/jQuery-2.1.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.form.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentJquery.js"></script>
<style>
    .red th{color: red}
    .green th{color: green}
    .blue th{color: blue}
    .attBor{border: 2px solid grey}
    b{color: red}
    .fixmTop{margin-top: 12px}
</style>
    <div class="content-page" ng-app="studentApp" ng-controller="studentCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <div class="row">
                    <!-- Page-Title -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 class="page-title">REGISTER NEW STUDENT</h4>
                                <ol class="breadcrumb">
                                    <li>Student</li>
                                    <li>new student</li>
                                </ol>
                            </div>
                        </div>
                        <!-- body information -->					
						<div class="row">
							<div class="col-md-12">
								<form  action="#" data-parsley-validate novalidate enctype="multipart/form-data" method="post" name="frmStudent">
								
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-border panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">PERSONAL INFORMATION</h3>
											</div>
											<div class="panel-body">
												<fieldset>
			                                        <div class="row">
			                                            <div class="col-md-11">
			                                            
			                                             <div class="col-md-2">
			                                                    <div class="form-group">
			                                                        <label for="iFirstName">Generation</label>
			                                                        <h4>{{genNameNotFinish | uppercase}}</h4>
			                                                    </div>
			                                                </div>
			                                            
			                                                <div class="col-md-4">
			                                                    <div class="form-group">
			                                                        <label for="iFirstName">FirstName<b>*</b></label>
			                                                        <input type="text" name="iFirstName" id="iFirstName" ng-model="iFirstName" parsley-trigger="change" required placeholder="Enter first name" class="form-control">
			                                                    </div>
			                                                </div>
			                                                
			                                                <div class="col-md-3">
			                                                  <div class="form-group">
			                                                    <label for="iLastName">LastName<b>*</b></label>
			                                                    <input type="text" name="iLastName" id="iLastName" ng-model="iLastName" parsley-trigger="change" required placeholder="Enter last name" class="form-control">
			                                                  </div>
			                                                </div>
			                                                
			                                                <div class="col-md-3">
			                                                  <div class="form-group">
			                                                    <label for="iDob">Birthdate<b>*</b></label>
			                                                  	<div class="input-group">
																	<input type="text" ng-model="iDob" class="form-control" placeholder="year-month-day" id="iDob" required name="iDob" >
																	<span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
																</div>
			                                                  </div>
			                                                </div>
			
				                                             <div class="col-md-2">
				                                                <div class="form-group">
				                                                    <label for="Gender">Gender<b>*</b></label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline" ng-init="iGender='m'">
				                                                    <input type="radio" value="m" name="iGender" ng-model="iGender">
				                                                    <label for="iGender"> Male </label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline">
				                                                    <input type="radio" value="f" name="iGender" ng-model="iGender">
				                                                    <label for="iGender"> Female </label>
				                                                </div>
				                                             </div>
			
			                                            <div class="col-md-3">
			                                              <div class="form-group">
			                                                <label for="iPhone">Phone<b>*</b></label>
			                                                <input type="text" name="iPhone" ng-model="iPhone" id="iPhone" data-mask="(999)-999-999" class="form-control">
			                                              </div>
			                                            </div>
			                                            <div class="col-md-3">
			                                              <div class="form-group">
			                                                <label for="iNationality">Nationality<b>*</b></label>
			                                                <select class="form-control" parsley-trigger="change" id="iNationality" name="iNationality" ng-model="iNationality">
			                                                    <optgroup label="Asia">
			                                                        <option>Cambodian</option>
			                                                        <option>Thai</option>
			                                                        <option>Vietnam</option>
			                                                        <option>Chinese</option>
			                                                        <option>Lao</option>
			                                                        <option>Indian</option>
			                                                        <option>Korean</option>
			                                                    </optgroup>
			                                                    <optgroup label="Europe">
			                                                        <option>English</option>
			                                                        <option>Spain</option>
			                                                        <option>Portuguese</option>
			                                                        <option>Poles</option>
			                                                        <option>Swedish</option>
			                                                        <option>Ukrainians</option>
			                                                        <option>Germans</option>
			                                                    </optgroup>
			                                                </select>
			                                              </div>
			                                            </div>
			                                             <div class="col-md-4">
			                                              <div class="form-group">
			                                                <label for="iSocailId">Social Id</label>
			                                                <input type="text" id="iSocailId" name="iSocailId" ng-model="iSocailId" parsley-trigger="change" required placeholder="Enter facebook, twitter ... id" class="form-control">
			                                              </div>
			                                            </div>
			                                        </div> <!--end left 9-->
			
			                                        <!--photo profile-->
			                                        	<label for="sAvatar">Photo<b>*</b></label>
				                                       	<input type="file" id="iAvatar" name="iAvatar" ng-model="iAvatar" class="file-chooser" style="display: none">
				                                        <div class="col-md-1">
															<img height="500" class="img-rounded" style="width: 105px; height: 117px"
																id="sAvatar" ng-click="browseImage()"
																src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
														</div>
			                                        </div> 
			                                        <!-- end photo profile -->
			
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label for="iAddress">Address<b>*</b></label>
			                                                <textarea name="iAddress" id="iAddress" ng-model="iAddress" required class="form-control" data-parsley-id="50" placeholder="Street, village, commune, district, province"></textarea>
			                                            </div>
			                                        </div>
												</fieldset>
											</div>
										</div>
									</div>
								</div>
								
	                                   
	
	                                 <!--Fieldset Parent -->
	                                 
	                                 <div class="row">
									<div class="col-md-12">
										<div class="panel panel-border panel-warning">
											<div class="panel-heading">
												<h3 class="panel-title">PARENT'S INFORMATION (OPTIONAL)</h3>
											</div>
											<div class="panel-body">
												<fieldset>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="iFatherName">Father name</label>
			                                                <input type="text" name="iFatherName" id="iFatherName" ng-model="iFatherName" parsley-trigger="change" required placeholder="Enter father's full name" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="iFatherPhone">Phone</label>
			                                                <input type="text" name="iFatherPhone" id="iFatherPhone" ng-model="iFatherPhone" placeholder="father's phone number" class="form-control">
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="iFatherJob">Occupation</label>
			                                                <input type="text" name="iFatherJob" id="iFatherJob" ng-model="iFatherJob" parsley-trigger="change" required placeholder="father's job" class="form-control">
			                                            </div>
			                                        </div>
			
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                              <label for="iMotherName">Mother name</label>
			                                              <input type="text" name="iMotherName" id="iMotherName" ng-model="iMotherName" parsley-trigger="change" required placeholder="Enter mother's full name" class="form-control" id="userName">
			                                            </div>
			                                        </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="iMotherPhone">Phone</label>
			                                        <input type="text" name="iMotherPhone" id="iMotherPhone" ng-model="iMotherPhone" placeholder="mother's phone number" class="form-control">
			                                      </div>
			                                    </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="iMotherJob">Occupation</label>
			                                        <input type="text" name="iMotherJob" id="iMotherJob" ng-model="iMotherJob" parsley-trigger="change" required placeholder="mother's job" class="form-control">
			                                      </div>
			                                    </div>
			
			                                    <div class="col-md-12">
			                                    <div class="form-group text-right m-b-0">
			                                      <button type="button" ng-click="addStudent()" class="btn btn-primary col-md-offset-11 col-md-1" name="saveStudent" id="saveStudent"
			                                      	ng-disabled="frmStudent.iFirstName.$invalid||frmStudent.iLastName.$invalid||frmStudent.iGender.$invalid||frmStudent.iPhone.$invalid||frmStudent.iNationality.$invalid||frmStudent.iEmail.$invalid||frmStudent.iAddress.$invalid">
			                                      	Save</button>
			                                    </div>
			                                  </div>
			                                </fieldset>
											</div>
										</div>
									</div>
								</div>
								
							</form>
						</div>
					</div>
                        
                </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" type="text/javascript"></script>
<!--<script>
 		$(function(){
 			$("#iAvatar").change(function(){
 				var formData = new FormData();
 				var uploadImgPath="http://localhost:8080/resources/static/images/avatars/";
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
 						xhr.setRequestHeader('Authorization', 'basic aHJkOiFAI2hyZGFwaQ==');
 		  	        },
 		            success: function(data) {
 		            	console.log(data);
 		            	$('#sAvatar').attr('src', uploadImgPath+data.ORIGINAL_IMAGE);
 		            },
 		         	error: function(data){
 		         		console.log(data);
 					}
 		        });
 			});
 		});	
	</script>-->
<jsp:include page="footer.jsp"></jsp:include>