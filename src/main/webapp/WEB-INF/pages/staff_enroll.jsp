<jsp:include page="header.jsp"></jsp:include>
<!-- <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/angular_material/1.1.0-rc2/angular-material.min.css"> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/bootstrap-multiselect.css" type="text/css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/angular-bootstrap-multiselect.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/studentEnrollStyle.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/static/js/staffEnrollAngular.js"></script>

    <div class="content-page" ng-app="staffEnrollApp" ng-controller="staffEnrollCtr" ng-cloak>
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                        	<div class="row">
                        		<h3>ENROLL STAFF</h3>
								<label>{{genNameNotFinish | uppercase}}</label>
								<span style="color: grey;" class="glyphicon glyphicon-triangle-right"></span>
								<label>{{couNameNotFinish|uppercase}} COURSE</label><br>
                                  
								<div class="btn-group col-md-offset-7 col-lg-offset-7 col-md-2 col-lg-2">
                                      <button type="button" class="btn btn-purple dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{newGenName}}  <span class=" fa fa-hand-pointer-o"></span></button>
                                      <ul class="dropdown-menu" role="menu">
                                      		<li><a href="#" ng-click="getInstructor()">All generations</a></li>
                                          	<li ng-repeat="gen in generations"><a href="#" ng-click="getGenerationById(gen.GENID)">{{gen.GENNAME}}</a></li>
                                      </ul>
                                </div>
								<div class="col-md-3 col-lg-3">
									<div class="input-group" style="margin-bottom: 5px">
										<input type="text" ng-model="searchKeyword" class="form-control" placeholder="Search ..." id="searchKeyword" required name="searchKeyword">
										<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-magnifier"></i></span>
									</div>
								</div>
									<table class="table tablesaw">
									    <thead>
									        <tr>
		                                      <th>Nº</th>
		                                      <th>Avatar</th>
		                                      <th>FullName</th>
		                                      <th>Generation</th>
		                                      <th>Course</th>
		                                      <th>Subject</th>
		                                      <th>Class</th>
		                                      <th style="text-align: center;">Delete</th>
		                                  	</tr>
									    </thead>
									    <tbody>
									        <tr dir-paginate="ins in instructors| filter: searchKeyword | itemsPerPage:5" ng-init="themePhoto=selectThemePhoto(ins.staff.STAAVATAR);">
		                                      <td>{{$index+1}}</td>
		                                      <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
		                                      <td><a href="#">{{ins.staff.STALASTNAME}} {{ins.staff.STAFIRSTNAME}}</a></td>
		                                      <td>{{ins.generation.GENNAME}}</td>
		                                      <td>{{ins.course.COUNAME}}</td>
		                                      <td>{{ins.subject.SUBNAME}}</td>
		                                      <td>{{ins.clas.CLANAME}}</td>  
		                                      <td style="text-align: center; color:red;"><a href="#" ng-click="deleteInstructor(ins.SPID)"><span class="glyphicon glyphicon-remove "></span></a></td>
		                                  </tr>
									    </tbody>
									</table>
									<div style="text-align: center">
										<dir-pagination-controls
									       max-size="5"
									       direction-links="true"
									       boundary-links="true" >
									    </dir-pagination-controls>
									</div><hr>
									<div class="col-lg-offset-11">
			                      		<button value="plus" class="btn btn-primary waves-effect waves-light" type="button" id="plusButton" ng-click="showAddStaff()"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
			                  		</div>                                                         
								</div>
                        </div>
                        
                <!-- ========== start body enroll statff ========== -->
	            <div class="row" id="staff-layout" style="display: none">
	                <div class="col-md-12">
	                    <div class="card-box">
	                        <h4 class="m-t-0 header-title"><b style="color: green;">Enroll Instructor</b></h4>
	                        <p class="text-muted font-13 m-b-30">
	                            Please fill all informations to the control form.
	                        </p>
	
	                        <form action="#" data-parsley-validate novalidate name="frmEnrollInstructor">
	                        <div class="row">
	
	                            <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInFirstName">Generation</label>
                                        <h4>{{genNameNotFinish|uppercase}}</h4>
                                      </div>
                                  </div>
	
	                            <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInLastName">Course</label>
                                        <h4>{{couNameNotFinish|uppercase}}</h4>
                                      </div>
                                  </div>
                                  
<!--                                   <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInLastName">Class<b>*</b></label>
                                       <select class="form-control" ng-model="getClassId" name="getClassId" required>
                                       		<option ng-repeat="class in classes" value="{{class.CLAID}}">{{class.CLANAME|uppercase}}</option>
                                       </select>
                                      </div>
                                  </div> -->
                                  
                                  <div class="btn-group col-sm-12 col-md-3 col-lg-2">
                                  	<label for="staInLastName">Class<b>*</b></label>
                                      <button type="button" class="btn btn-default dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{newClaName|uppercase}}  <span class="glyphicon glyphicon-arrow-down"></span></button>
                                      <ul class="dropdown-menu" role="menu">
                                          	<li ng-repeat="class in classes"><a href="#" ng-click="getClassById(class.CLAID)">{{class.CLANAME|uppercase}}</a></li>
                                      </ul>
                                  </div>
                                  
<!--                                   <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInLastName">Subject<b>*</b></label>
                                       <select class="form-control" ng-model="getSubjectId" name="getSubjectId" required>
                                       		<option ng-repeat="subject in subjects" value="{{subject.SUBID}}">{{subject.SUBNAME|uppercase}}</option>
                                       </select>
                                      </div>
                                  </div> -->
                                  
                                  <div class="btn-group col-sm-12 col-md-3 col-lg-2">
                                  	<label for="staInLastName">Subject<b>*</b></label>
                                      <button type="button" class="btn btn-pink dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{newSubName|uppercase}}  <span class="glyphicon glyphicon-arrow-down"></span></button>
                                      <ul class="dropdown-menu" role="menu">
                                          	<li ng-repeat="subject in subjects"><a href="#" ng-click="getSubjectById(subject.SUBID)">{{subject.SUBNAME|uppercase}}</a></li>
                                      </ul>
                                  </div>
                                  
                                  <div class="col-sm-12 col-md-3 col-lg-3">
                                      <div class="form-group">
                                        <label for="staInLastName">Instructor<b>*</b></label>
	                                      <select class="form-control" ng-model="getInstructorId" name="getInstructorId" required>
	                                       		<option ng-repeat="staff in staffs" value="{{staff.studyProcess.STAID}}">{{staff.STALASTNAME}} {{staff.STAFIRSTNAME}}</option>
	                                       </select>
                                      </div>
                                  </div>
	
	                            <div class="col-sm-12 col-md-1 col-lg-1">
	                                <div class="form-group text-center m-b-0">
	                                    <label>Click</label>
	                                    <button ng-click="addEnrollInstructor()" ng-disabled="frmEnrollInstructor.getInstructorId.$invalid" class="btn btn-primary col-lg-12 waves-effect waves-light" type="button">Enroll</button>
	                                </div>
	                            </div>
	                            
	                          </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
                <!-- ========== end body enroll staff ========== -->	
                        
                    </div>                
                </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>     
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/dirPagination.js"></script>
<jsp:include page="footer.jsp"></jsp:include>