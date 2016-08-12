<jsp:include page="header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.form.min.js" type="text/javascript"></script>
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
			                                                        <div class="input-group">
																		<input type="text" ng-model="iFirstName" class="form-control" placeholder="student first name" id="iFirstName" required name="iFirstName">
																		<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
																	</div>
			                                                    </div>
			                                                </div>
			                                                
			                                                <div class="col-md-3">
			                                                  <div class="form-group">
			                                                    <label for="iLastName">LastName<b>*</b></label>
			                                                    <div class="input-group">
																	<input type="text" ng-model="iLastName" class="form-control" placeholder="student last name" id="iLastName" required name="iLastName">
																	<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
																</div>
			                                                  </div>
			                                                </div>
			                                                
			                                                <div class="col-md-3">
			                                                  <div class="form-group">
			                                                    <label for="iDob">Birthdate<b>*</b></label>
			                                                  	<div class="input-group">
																	<input type="text" ng-model="iDob" class="form-control" placeholder="year-month-day" id="iDob" required name="iDob">
																	<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-calender"></i></span>
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
			
			                                            <div class="col-md-4">
			                                              <div class="form-group">
			                                                <label for="iPhone">Phone<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" ng-model="iPhone" class="form-control" data-mask="(999)-999-999*" placeholder="phone number" id="iPhone" required name="iPhone">
																<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-phone "></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                            <div class="col-md-3">
			                                              <div class="form-group">
			                                                <label for="iNationality">Nationality<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" ng-model="iNationality" class="form-control" placeholder="Cambodian, Thai, Lao, ...." id="iNationality" required name="iNationality">
																<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-globe"></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                             <div class="col-md-3">
			                                              <div class="form-group">
			                                                <label for="iSocailId">Social Id</label>
			                                                <div class="input-group">
																<input type="text" ng-model="iSocailId" class="form-control" placeholder="Enter facebook, twitter ... id" id="iSocailId" required name="iSocailId">
																<span class="input-group-addon bg-primary b-0 text-white"><i class=" icon-social-facebook"></i></span>
															</div>
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
			                                                <div class="input-group">
																<input type="text" ng-model="iFatherName" class="form-control" placeholder="father's full name" id="iFatherName" required name="iFatherName">
																<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-user"></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="iFatherPhone">Phone</label>
			                                                <div class="input-group">
																<input type="text" ng-model="iFatherPhone" class="form-control" data-mask="(999)-999-999*" placeholder="father phone number" id="iFatherPhone" required name="iFatherPhone">
																<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-phone "></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="iFatherJob">Occupation</label>
			                                                <div class="input-group">
																<input type="text" ng-model="iFatherJob" class="form-control" placeholder="father's job" id="iFatherJob" required name="iFatherJob">
																<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-flag"></i></span>
															</div>
			                                            </div>
			                                        </div>
			
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                              <label for="iMotherName">Mother name</label>
			                                              <div class="input-group">
																<input type="text" ng-model="iMotherName" class="form-control" placeholder="mother's full name" id="iMotherName" required name="iMotherName">
																<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-user-female"></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="iMotherPhone">Phone</label>
			                                        <div class="input-group">
														<input type="text" ng-model="iMotherPhone" class="form-control" data-mask="(999)-999-999*" placeholder="father phone number" id="iMotherPhone" required name="iMotherPhone">
														<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-phone "></i></span>
													</div>
			                                      </div>
			                                    </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="iMotherJob">Occupation</label>
			                                        <div class="input-group">
														<input type="text" ng-model="iMotherJob" class="form-control" placeholder="mother's job" id="iMotherJob" required name="iMotherJob">
														<span class="input-group-addon bg-warning b-0 text-white"><i class="icon-flag"></i></span>
													</div>
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
<script src="${pageContext.request.contextPath}/resources/static/js/studentAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>