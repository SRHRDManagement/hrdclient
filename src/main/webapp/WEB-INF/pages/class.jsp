<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/classStyle.css" rel="stylesheet">
    <div class="content-page" ng-app="classApp" ng-controller="classCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">Class</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Study Management</a></li>
                            <li class="active">Class</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                        
                       		<ul class="pagination pagination-split"><h2><li>Generation:	</li></h2></ul>
	                        <ul class="pagination pagination-split" id="listGenerations">
								<li ng-repeat="gen in generations | orderBy:'GENID'" ng-class="{'active' : $index==currentGen}">
									<a href="#" ng-click="getCourseByGeneration(gen.GENID)">{{gen.GENNAME}}</a>
								</li>
							</ul>
							<ul class="pagination pagination-split"><h2><li>&emsp;Course:	</li></h2></ul>
							<ul class="pagination pagination-split" id="listCourses">
								<li ng-repeat="cou in courses | orderBy:'COUID'" ng-class="{'activeClass' : $index==currentCou}">
									<a href="#" ng-click="getClassByCourse(cou.COUID)">{{cou.COUNAME}}</a>
								</li>
							</ul><hr>
						
                            <div class="row" id="resultClass">
                                <!--siem reab-->
                                <div ng-repeat="cla in classes | orderBy:CLAID" ng-init="tapTheme=selectTheme(cla.CLAACTIVE)" class="col-xs-6 col-sm-2 col-md-2 box effect7" style="background-color: {{tapTheme[0]}}">
                                    <div class="spacecourse">
                                        <p style="color: #ffffff;"><i>{{cla.CLADATE}}</i></p>
                                        <h3 style="color: rgba(210, 255, 214, 0.83); text-align: center"><b style="color: #ffffff">{{cla.CLANAME | uppercase}}</b></h3>
                                        <div>
                                        	<div class="row" style="text-align: right;">
                                            <button type="button" class="btn-white btn-rounded col-md-offset-6 col-md-3 {{tapTheme[1]}}" ng-click="disableClass(cla.CLAID)" ><i class="{{tapTheme[2]}}"></i></button>
											<button type="button" class="btn-white btn-rounded col-md-3 {{tapTheme[1]}}" ng-click="getClassById(cla.CLAID)" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#class-modal"><i class="fa fa-pencil"></i></button>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="courseNotFound" style="display: none"><h1 style="text-align: center">Never create class in {{lastCourseName | uppercase}} course!</h1></div>
                                <div id="courseNotFound2" style="display: none"><h1 style="text-align: center">Have not course in {{lastGenerationName | uppercase}} course!</h1></div>

                            </div>
                            <div class="col-md-offset-11">
                                <button value="plus" ng-click="showAddClassForm()" class="btn btn-primary waves-effect waves-light" type="button" id="addClassButton"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
                <div class="row" id="addClass-layout" style="display:none;">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><b>Add class</b></h4>
                            <p class="text-muted font-13 m-b-30">
                                Please fill all information to the control form.
                            </p>

                            <form action="#" data-parsley-validate novalidate name="frmAddClass">
	                            <div class="row">
	                            
		                            <div class="col-md-2">
	                                    <div class="form-group">
	                                        <label for="couName">Generation <span style="color: red">*</span></label>
	                                        <h4>{{generationNotFinish.GENNAME | uppercase}}</h4>
	                                    </div>
	                                </div>
	                                
	                                <div class="col-md-2">
	                                    <div class="form-group">
	                                        <label for="couName">Course <span style="color: red">*</span></label>
	                                        <h4>{{courseNotFinish.COUNAME | uppercase}} Course</h4>
	                                    </div>
	                                </div>
	                            
	                                 <div class="col-md-3">
	                                    <div class="form-group">
	                                        <label for="couName">NAME <span style="color: red">*</span></label>
	                                        <input type="text" required placeholder="Class Name" ng-model="addClassName" id="addClassName" name="addClassName" class="form-control" >
	                                    </div>
	                                </div>
	
	                                <div class="col-md-3 ">
	                                    <div class="form-group">
	                                        <label for="couDate">Date <span style="color: red">*</span></label>
	                                        <div class="input-group">
												<input type="text" ng-model="classInsertDate" class="form-control" placeholder="year-month-day" id="classInsertDate" required name="classInsertDate" >
												<span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
											</div>
	                                    </div>
	                                </div>
	
	                                <div class="col-md-2">
	                                    <div class="form-group text-center m-b-0">
	                                        <label>Click here</label>
	                                        <button ng-click="addClassRoom()" id="saveClass" ng-disabled="frmAddClass.addClassName.$invalid||frmAddClass.classInsertDate.$invalid" class="btn btn-primary col-md-12 waves-effect waves-light" type="button">Save</button>
	                                    </div>
	                                </div>
								</div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="class-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">Update Class</h4>
		            </div>
		            <form action="#" name="frmUpdateCourse">
			            <div class="modal-body">
			                <div class="row">
			                    <div class="col-md-6">
			                         <div class="form-group">
			                             <label>NAME <span style="color: red">*</span></label>
			                             <input type="text" required ng-model="newClaName" placeholder="New Generation Name"  class="form-control"  name="newClaName">
			                         </div>
			                    </div>
			                    <div class="col-md-6">
				                    <div class="form-group">
				                        <label>DATE <span style="color: red">*</span></label>
				                        <div class="input-group">
											<input type="text" ng-model="newClaDate" class="form-control" placeholder="year-month-day" id="newClaDate" required name="newClaDate" >
											<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
										</div>
			                          </div>
			                      </div>
			                </div>
			            </div>
			            <div class="modal-footer">
			                <button ng-click="updateClass()" ng-disabled="frmUpdateCourse.newClaName.$invalid ||frmUpdateCourse.newClaDate.$invalid" type="button" data-dismiss="modal" class="btn btn-pink waves-effect waves-light">Update</button>
			            </div>
					</form>
		        </div>
		    </div>
		</div><!-- /.modal -->
        
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/classAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/classJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>