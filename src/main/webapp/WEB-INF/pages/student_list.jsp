<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/easy-autocomplete.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/css/easy-autocomplete.themes.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/static/js/studentListAngular.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/studentStyle.css" rel="stylesheet" type="text/css"/>
    <div class="content-page" ng-app="studentListApp" ng-controller="studentListCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">STUDENT</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Student</a></li>
                            <li class="active">Student List</li>
                        </ol>
                    </div>
                </div>
                
				<div class="row" id="studentList">
					<div class="col-sm-12">
						<div class="card-box">
							<h4 class="m-t-0 header-title"><b>STUDENT LIST</b></h4>
							<!-- <p class="text-muted font-13">you can click on student name to his or her timeline.</p> -->
							<div class="col-md-offset-10 col-md-2">
							<div class="input-group" style="margin-bottom: 5px">
								<input type="text" ng-model="searchKeyword" class="form-control" placeholder="Search ..." id="searchKeyword" required name="searchKeyword">
								<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-magnifier"></i></span>
							</div>
							</div>
							<table class="table tablesaw">
							    <thead>
							        <tr>
                                      <th><span class="glyphicon glyphicon-cog"></span></th>
                                      <th>Avatar</th>
                                      <th>FullName</th>
                                      <th>Gender</th>
                                      <th>Birthdate</th>
                                      <th>Phone</th>
                                      <th>Nationality</th>
                                      <th>Status</th>
                                  	</tr>
							    </thead>
							    <tbody>
							        <tr dir-paginate="stu in students| filter: searchKeyword | itemsPerPage:7" ng-init="gender=fillGender(stu.STUGENDER); themeStatus=selectThemeStatus(stu.STUSTATUS)">
                                      <td><a href="#" ng-click="getStudentById(stu.STUID)"><i class="fa fa-pencil"></i></a></td>
                                      <td><div class="center-cropped"><a href="#"><img class="img-circle" src="{{imgUrl}}{{stu.STUAVATAR}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></div></td>
                                      <td><a href="#">{{stu.STULASTNAME}} {{stu.STUFIRSTNAME}}</a></td>
                                      <td style="color: {{gender[1]}}">{{gender[0]}}</td>
                                      <td>{{stu.STUDOB}}</td>
                                      <td>{{stu.STUPHONE}}</td>
                                      <td>{{stu.STUNATIONALITY}}</td>
                                      <td><button class="btn btn-xs {{themeStatus}}">{{stu.STUSTATUS}}</button></td>
                                  </tr>
							    </tbody>
							</table>
							<div style="text-align: center">
								<dir-pagination-controls
							       max-size="7"
							       direction-links="true"
							       boundary-links="true" >
							    </dir-pagination-controls>
							</div>
						</div>
					</div>
				</div>
						
					<!-- ========== start body update ========== -->
                <div id="updateView" class="row" style="display: none">
                        <!-- body information -->					
						<div class="row">
							<div class="col-sm-12 col-md-12 col-lg-12">
								
								<form  action="#" data-parsley-validate novalidate enctype="multipart/form-data" method="post" name="frmStudent">
								
								<div class="row">
									<div class="col-sm-12 col-md-12 col-lg-12">
										<div class="panel panel-border panel-primary">
											<h3><button type="button" class="btn btn-custom btn-rounded btn-primary" ng-click="backToStudentList()"><span class="icon-action-undo"></span> BACK</button></h3>
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
			                                                        <label for="uFirstName">FirstName<b>*</b></label>
			                                                        <div class="input-group">
																		<input type="text" ng-model="uFirstName" class="form-control" placeholder="student first name" id="uFirstName" required name="uFirstName">
																		<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-user"></i></span>
																	</div>
			                                                    </div>
			                                                </div>
			                                                
			                                                <div class="col-sm-12 col-md-4 col-lg-3">
			                                                  <div class="form-group">
			                                                    <label for="uLastName">LastName<b>*</b></label>
			                                                    <div class="input-group">
																	<input type="text" ng-model="uLastName" class="form-control" placeholder="student last name" id="uLastName" required name="uLastName" autocomplete="on">
																	<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-user"></i></span>
																</div>
			                                                  </div>
			                                                </div> 
			                                                
			                                                <div class="col-sm-12 col-md-5 col-lg-3">
			                                                  <div class="form-group">
			                                                    <label for="uDob">Birthdate<b>*</b></label>
			                                                  	<div class="input-group">
																	<input type="text" ng-model="uDob" class="form-control" placeholder="year-month-day" id="uDob" required name="uDob">
																	<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
																</div>
			                                                  </div>
			                                                </div>
			
				                                             <div class="col-sm-12 col-md-2 col-lg-2">
				                                                <div class="form-group">
				                                                    <label for="Gender">Gender<b>*</b></label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline" ng-init="uGender='m'">
				                                                    <input type="radio" value="m" name="uGender" ng-model="uGender">
				                                                    <label for="uGender">M</label>
				                                                </div>
				                                                <div class="radio radio-info radio-inline">
				                                                    <input type="radio" value="f" name="uGender" ng-model="uGender">
				                                                    <label for="uGender">F</label>
				                                                </div>
				                                             </div>
			
			                                            <div class="col-sm-12 col-md-5 col-lg-4">
			                                              <div class="form-group">
			                                                <label for="uPhone">Phone<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" class="form-control" data-mask="(999)-999-999*" placeholder="phone number" ng-model="uPhone" id="uPhone" required name="uPhone">
																<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-phone "></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                            <div class="col-sm-12 col-md-6 col-lg-3">
			                                              <div class="form-group">
			                                                <label for="uNationality">Nationality<b>*</b></label>
			                                                <div class="input-group">
																<input type="text" class="form-control" placeholder="Cambodian, Thai, Lao, ...." id="uNationality" ng-model="uNationality" required name="uNationality">
																<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-globe"></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                             <div class="col-sm-12 col-md-6 col-lg-3">
			                                              <div class="form-group">
			                                                <label for="uSocailId">Social Id</label>
			                                                <div class="input-group">
																<input type="text" ng-model="uSocailId" class="form-control" placeholder="Enter facebook, twitter ... id" id="uSocailId" required name="uSocailId">
																<span class="input-group-addon bg-primary b-0 text-white"><i class=" icon-social-facebook"></i></span>
															</div>
			                                              </div>
			                                            </div>
			                                        </div> <!--end left 9-->
			
			                                        <!--photo profile-->
			                                        	<label for="sAvatar">Photo profile</label>
				                                       	<input type="file" id="uAvatar" name="uAvatar" ng-model="uAvatar" class="file-chooser" style="display: none">
				                                        <div class="col-sm-12 col-md-6 col-lg-2" style="text-align: center">
															<img height="500" class="img-rounded" style="width: 65%; height: 117px"
																id="sAvatar" ng-click="browseImage()"
																src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
														</div>
			                                        </div> 
			                                        <!-- end photo profile -->
			
			                                        <div class="col-md-12">
			                                            <div class="form-group">
			                                                <label for="uAddress">Address<b>*</b></label>
			                                                <textarea name="uAddress" ng-model="uAddress" id="uAddress" required class="form-control" data-parsley-id="50" placeholder="Street, village, commune, district, province" autocomplete="on"></textarea>
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
			                                                <label for="uFatherName">Father name</label>
			                                                <div class="input-group">
																<input type="text" ng-model="uFatherName" class="form-control" placeholder="father's full name" id="uFatherName" required name="uFatherName">
																<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-user"></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="uFatherPhone">Phone</label>
			                                                <div class="input-group">
																<input type="text" ng-model="uFatherPhone" class="form-control" data-mask="(999)-999-999*" placeholder="father phone number" id="uFatherPhone" required name="uFatherPhone">
																<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-phone "></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                                <label for="uFatherJob">Occupation</label>
			                                                <div class="input-group">
																<input type="text" ng-model="uFatherJob" class="form-control" placeholder="father's job" id="uFatherJob" required name="uFatherJob">
																<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-flag"></i></span>
															</div>
			                                            </div>
			                                        </div>
			
			                                        <div class="col-md-4">
			                                            <div class="form-group">
			                                              <label for="uMotherName">Mother name</label>
			                                              <div class="input-group">
																<input type="text" ng-model="uMotherName" class="form-control" placeholder="mother's full name" id="uMotherName" required name="uMotherName">
																<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-user-female"></i></span>
															</div>
			                                            </div>
			                                        </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="uMotherPhone">Phone</label>
			                                        <div class="input-group">
														<input type="text" ng-model="uMotherPhone" class="form-control" data-mask="(999)-999-999*" placeholder="father phone number" id="uMotherPhone" required name="uMotherPhone">
														<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-phone "></i></span>
													</div>
			                                      </div>
			                                    </div>
			                                    <div class="col-md-4">
			                                      <div class="form-group">
			                                        <label for="uMotherJob">Occupation</label>
			                                        <div class="input-group">
														<input type="text" ng-model="uMotherJob" class="form-control" placeholder="mother's job" id="uMotherJob" required name="uMotherJob">
														<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-flag"></i></span>
													</div>
			                                      </div>
			                                    </div>
			
			                                    <div class="col-md-12">
			                                    <div class="form-group text-right m-b-0">
			                                      <button type="button" ng-click="updateStudent()" class="btn btn-default col-md-offset-11 col-md-1" name="saveStudent" id="saveStudent"
			                                      	ng-disabled="frmStudent.uFirstName.$invalid||frmStudent.uLastName.$invalid||frmStudent.uGender.$invalid||frmStudent.uPhone.$invalid||frmStudent.uNationality.$invalid||frmStudent.uEmail.$invalid||frmStudent.uAddress.$invalid||frmStudent.uDob.$invalid">
			                                      	Update</button>
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
<script src="http://maps.googleapis.com/maps/api/js?v=3&key=AIzaSyCFcG3DoUXIdmdF4zjdZmiCQHsR0i7395U&sensor=false&amp;libraries=places&cambodia=in" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/dirPagination.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/jquery.easy-autocomplete.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/studentListJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>