<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/easy-autocomplete.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/css/easy-autocomplete.themes.min.css" rel="stylesheet" type="text/css">
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
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h4 class="page-title">REGISTER NEW STUDENT</h4>
                                <ol class="breadcrumb">
                                    <li>Student</li>
                                    <li>new student</li>
                                </ol>
                            </div>
                        </div>
                        <!-- body information -->					
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12">
								<form  action="#" data-parsley-validate novalidate enctype="multipart/form-data" method="post" name="frmStudent">
								
								<div class="row">
									<div class="col-sm-12 col-md-12 col-lg-12">
										<div class="panel panel-border panel-primary">
											<div class="panel-heading">
												<h3 class="panel-title">PERSONAL INFORMATION</h3>
											</div>
											<div class="panel-body">
												<fieldset>
			                                        <div class="row">
			                                            <div class="col-sm-10 col-md-10 col-lg-10">
			                                            
			                                             <div class="col-sm-12 col-md-4 col-lg-2">
			                                                    <div class="form-group">
			                                                        <label for="iFirstName">Generation</label>
			                                                        <h5>{{genNameNotFinish | uppercase}}</h5>
			                                                    </div>
			                                                </div>
			                                            
			                                                <div class="col-sm-12 col-md-4 col-lg-4">
			                                                    <div class="form-group">
			                                                        <label for="iFirstName">FirstName<b>*</b></label>
			                                                        <div class="input-group">
																		<input type="text" ng-model="iFirstName" class="form-control" placeholder="student first name" id="iFirstName" required name="iFirstName">
																		<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
																	</div>
			                                                    </div>
			                                                </div>
			                                                
			                                                <div class="col-sm-12 col-md-4 col-lg-3">
			                                                  <div class="form-group">
			                                                    <label for="iLastName">LastName<b>*</b></label>
			                                                    <div class="input-group">
																	<input type="text" ng-model="iLastName" class="form-control" placeholder="student last name" id="iLastName" required name="iLastName" autocomplete="on">
																	<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
																</div>
			                                                  </div>
			                                                </div> 
			                                                
			                                                <div class="col-sm-12 col-md-5 col-lg-3">
			                                                  <div class="form-group">
			                                                    <label for="iDob">Birthdate<b>*</b></label>
			                                                  	<div class="input-group">
																	<input type="text" ng-model="iDob" class="form-control" placeholder="year-month-day" id="iDob" required name="iDob">
																	<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-calender"></i></span>
																</div>
			                                                  </div>
			                                                </div>
			
				                                             <div class="col-sm-12 col-md-2 col-lg-2">
				                                                <div class="form-group">
				                                                    <label for="Gender">Gender<b>*</b></label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline" ng-init="iGender='m'">
				                                                    <input type="radio" value="m" name="iGender" ng-model="iGender">
				                                                    <label for="iGender">M</label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline">
				                                                    <input type="radio" value="f" name="iGender" ng-model="iGender">
				                                                    <label for="iGender">F</label>
				                                                </div>
				                                             </div>
			
			                                            <div class="col-sm-12 col-md-5 col-lg-4">
			                                              <div class="form-group">
			                                                <label for="iPhone">Phone<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" class="form-control" data-mask="(999)-999-999*" placeholder="phone number" ng-model="iPhone" id="iPhone" required name="iPhone">
																<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-phone "></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                            <div class="col-sm-12 col-md-6 col-lg-3">
			                                              <div class="form-group">
			                                                <label for="iNationality">Nationality<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" class="form-control" placeholder="Cambodian, Thai, Lao, ...." id="iNationality" ng-model="iNationality" required name="iNationality">
																<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-globe"></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                             <div class="col-sm-12 col-md-6 col-lg-3">
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
			                                        	<label for="sAvatar">Photo profile</label>
				                                       	<input type="file" id="iAvatar" name="iAvatar" ng-model="iAvatar" class="file-chooser" style="display: none">
				                                        <div class="col-sm-12 col-md-6 col-lg-2" style="text-align: center">
															<img height="500" class="img-rounded" style="width: 65%; height: 117px"
																id="sAvatar" ng-click="browseImage()"
																src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
														</div>
			                                        </div> 
			                                        <!-- end photo profile -->
			
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label for="iAddress">Address<b>*</b></label>
			                                                <textarea name="iAddress" ng-model="iAddress" id="iAddress" required class="form-control" data-parsley-id="50" placeholder="Street, village, commune, district, province" autocomplete="on"></textarea>
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
			                                      	ng-disabled="frmStudent.iFirstName.$invalid||frmStudent.iLastName.$invalid||frmStudent.iGender.$invalid||frmStudent.iPhone.$invalid||frmStudent.iNationality.$invalid||frmStudent.iEmail.$invalid||frmStudent.iAddress.$invalid||frmStudent.iDob.$invalid">
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
<!-- scripe load address -->
<script src="http://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyCFcG3DoUXIdmdF4zjdZmiCQHsR0i7395U&sensor=false&amp;libraries=places&cambodia=in" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentAngular.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/static/js/jquery-1.11.2.min.js" type="text/javascript"></script> --%>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.easy-autocomplete.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>