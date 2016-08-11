<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/bootstrap-select.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/css/courseStyle.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/static/css/message.css" rel="stylesheet" type="text/css">
    
    <div class="content-page" ng-app="courseApp" ng-controller="courseCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">COURSES</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Study Management</a></li>
                            <li class="active">Course</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                        <ul class="pagination pagination-split" id="listGenerations">
							<li ng-repeat="gen in generations | orderBy:'GENID'" ng-class="{'active' : $index==currentGen}">
								<a href="#" ng-click="getCourseByGeneration(gen.GENID)">{{gen.GENNAME}}</a>
							</li>
						</ul><hr>
                            <div class="row" id="result">
                                <!--course loop-->
                                <div ng-repeat="course in courses | orderBy:-COUID" ng-init="tapTheme=selectTheme(course.COUISFINISH)" class="col-md-3 box box8 shadow3" style="background-color: {{tapTheme[0]}};">
                                    <h2 style="text-align: center; color: white"><b>{{course.COUNAME | uppercase}}</b></h2>
									<p class="col-md-6" style="color: white; text-align: center"><i>Start: <b>{{course.COUSTARTDATE}}</b></i></p>
									<p class="col-md-6" style="color: white; text-align: center"><i>End: <b>{{course.COUENDDATE}}</b></i></p>
									<button type="button" class="btn-white col-md-6 {{tapTheme[1]}}" ng-click="disableCourse(course.COUID)" ><i class="{{tapTheme[2]}}"></i></button>
									<button type="button" class="btn-white col-md-6 {{tapTheme[1]}}" ng-click="getCourseById(course.COUID)" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#course-modal"><i class="fa fa-pencil"></i></button>
                                </div>
								<div id="courseNotFound" style="display: none"><h1 style="text-align: center">Never create course in {{lastGenerationName}}!</h1></div>
                            </div>
                            <div class="col-lg-offset-11">
                            	<button value="plus" class="btn btn-primary waves-effect waves-light" ng-click="showAddCourseForm()" type="button" id="btnShowAddCourseView"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
                       		 </div>
                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
                <div class="row" id="addCourse-layout" style="display: none">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><b>add new course</b></h4>
                            <p class="text-muted font-13 m-b-30">
                                Please fill all information to the control form.
                            </p>

                            <form action="#" data-parsley-validate novalidate name="frmAddCourse">
                            <div class="row">

                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="couName">Generation <span style="color: red">*</span></label>
                                        <h4>{{generationNotFinish.GENNAME | uppercase}}</h4>
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="couName">NAME <span style="color: red">*</span></label>
                                        <input type="text" ng-model="modCouName" name="modCouName" required placeholder="Course Name" id="couName" class="form-control" >
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="couDate">Start Date <span style="color: red">*</span></label>
                                         <div class="input-group">
										<input type="text" ng-model="modCouStartDate" class="form-control" placeholder="year-month-day" id="modCouStartDate" required name="modCouStartDate">
											<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
										</div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="couDate">End Date <span style="color: red">*</span></label>
                                        <div class="input-group">
										<input type="text" ng-model="modCouEndDate" class="form-control" placeholder="year-month-day" id="modCouEndDate" required name="modCouEndDate">
											<span class="input-group-addon bg-success b-0 text-white"><i class="icon-calender"></i></span>
										</div>
                                    </div>
                                </div>

                                <div class="col-md-1">
                                    <div class="form-group text-center m-b-0">
                                        <label>click here</label>
                                        <button id="saveCourse" ng-click="addCourse()" class="btn btn-primary col-md-12 waves-effect waves-light" type="button"
                                        ng-disabled="frmAddCourse.couGeneration.$invalid || frmAddCourse.modCouName.$invalid || frmAddCourse.modCouStartDate.$invalid || frmAddCourse.modCouEndDate.$invalid || frmAddCourse.modCouColor.$invalid">Save</button>
                                    </div>
                                </div>
                                
							</div>
                          </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
		<div id="course-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">Update Course</h4>
		            </div>
		            <form action="#" name="frmUpdateCourse">
			            <div class="modal-body">
			                <div class="row">
			                    <div class="col-md-12">
			                         <div class="form-group">
			                             <label>NAME <span style="color: red">*</span></label>
			                             <input type="text" required ng-model="newCouName" placeholder="New Generation Name"  class="form-control"  name="newCouName">
			                         </div>
			                    </div>
			                    <div class="col-md-6">
				                    <div class="form-group">
				                        <label>START <span style="color: red">*</span></label>
				                        <div class="input-group">
											<input type="text" ng-model="newCouStartDate" class="form-control" placeholder="year-month-day" id="couStartDate" required name="newCouStartDate" >
											<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
										</div>
			                          </div>
			                      </div>
			                      <div class="col-md-6">
				                    <div class="form-group">
				                        <label>END <span style="color: red">*</span></label>
				                        <div class="input-group">
											<input type="text" ng-model="newCouEndDate" class="form-control" placeholder="year-month-day" id="couEndDate" required name="newCouEndDate" >
											<span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
										</div>
			                          </div>
			                      </div>
			                </div>
			            </div>
			            <div class="modal-footer">
			                <button ng-click="updateCourse()" ng-disabled="frmUpdateCourse.newCouName.$invalid ||frmUpdateCourse.newCouStartDate.$invalid ||frmUpdateCourse.newCouEndDate.$invalid" type="button" data-dismiss="modal" class="btn btn-pink waves-effect waves-light">Update</button>
			            </div>
					</form>
		        </div>
		    </div>
		</div><!-- /.modal -->
        
    </div><!-- End controller -->
</div>

<script src="${pageContext.request.contextPath}/resources/static/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/courseAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/courseJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>