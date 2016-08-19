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
                        		<label>ENROLL STAFF</label>
								<span style="color: grey;" class="glyphicon glyphicon-triangle-right"></span>
								<label>{{genNameNotFinish | uppercase}}</label>
								<span style="color: grey;" class="glyphicon glyphicon-triangle-right"></span>
								<label>{{couNameNotFinish|uppercase}} COURSE</label>
								<span style="color: grey;" class="glyphicon glyphicon-triangle-right"></span>
								<div class="btn-group">
                                      <button type="button" class="btn btn-primary dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false">{{newClaName|uppercase}}   <span class="caret"></span></button>
                                      <ul class="dropdown-menu" role="menu">
                                          <li ng-repeat="cla in classes"><a href="#" ng-click="getClassById(cla.CLAID)">{{cla.CLANAME|uppercase}}</a></li>
                                      </ul>
                                  </div>
                                  <form action="#" name="frmEnroll" method="post">
	                                  <h1 class="m-t-0 header-title  col-lg-offset-6" style="text-align:center !important;">Enroll to <b style="font-size: 1.2em; color: darkblue;">{{newClaName}}</b> class <button type="button" ng-click="enrollStudent()" class="btn btn-pink">Enroll now</button></h1>
	                                  <div class="table-responsive" >
	                    				<div class="col-sm-6">
	                                        <table id="datatable-buttons" class="table tablesaw">
	                                            <thead>
	                                                <tr>
	                                                    <th class="col-md-1 col-lg-1">No</th>
	                                                    <th class="col-md-3 col-lg-3">Student Name</th>
	                                                    <th class="col-md-1 col-lg-1">Gender</th>
	                                                    <th class="col-md-2 col-lg-2 center">Photo</th>
	                                                    <th class="col-md-3 col-lg-3 center">Subject</th>
	                                                    <th class="col-md-2 col-lg-2">
	                                                    	<!-- <input id="selecct_all" type="checkbox"> -->
	                                                    	<label class="control control--checkbox center" style="transform: scale(1.5);">
														      <input type="checkbox" class="checkbox" id="selecct_all" value="{{stu.STUID}}" ng-click="studentSelected(stu.STUID)" name="cbbEnroll"/>
														      <div class="control__indicator" style="border-radius: 15px; background: grey;"></div>
	                                                    </th>
	                                                </tr>
	                                            </thead>
	                                            <tbody>
	                                                <tr ng-repeat="sta in staffs" ng-init="gender=fillGender(sta.STAGENDER); themePhoto=selectThemePhoto(sta.STAAVATAR);">
	                                                    <td>{{$index+1}}</td>
	                                                    <td><a href="#">{{sta.STALASTNAME}} {{sta.STAFIRSTNAME}}</a></td>
	                                                    <td style="color: {{gender[1]}}">{{gender[0]}}</td>
	                                                    <td class="center"><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
	                                                   	<td>
	                                                   		<multiselect
																    ng-model="multiselectModel[sta.STAID]"
																    options="sub.SUBNAME for sub in subjects"
																    data-multiple="true">
															</multiselect>
														</td>
	                                                   	<td>
			                                            	<!-- <input name="cbbEnroll[]" type="checkbox" style="transform: scale(1.5);"> -->
			                                            	<label class="control control--checkbox center" style="transform: scale(1.5);">
														      <input type="checkbox" class="checkbox" value="{{sta.STAID}}" ng-click="studentSelected(sta.STAID)" name="cbbEnroll"/>
														      <div class="control__indicator"></div>
														    </label>
			                                        	</td>
	                                                </tr>
	                                            </tbody>
	                                        </table>  
	                                        <div style="text-align: center"><label id="noNotEnroll">No students not enroll</label></div>
	                                </div>
	
	                                <div class="col-sm-6">
	                                        <table id="datatable-buttons" class="table tablesaw" >
	                                            <thead>
	                                                <tr>
	                                                    <th>No</th>
	                                                    <th>Student Name</th>
	                                                    <th>Gender</th>
	                                                    <th>Photo</th>
	                                                    <th><span class="fa fa-refresh"></span>
	                                                </tr>
	                                            </thead>
		
	                                            <tbody>
	                                               <tr ng-repeat="en in studentsEnroll" ng-init="gender=fillGender(en.STUDENT.STUGENDER); themePhoto=selectThemePhoto(en.STUDENT.STUAVATAR);">
	                                                     <td>{{$index+1}}</td>
	                                                    <td><a href="#">{{en.STUDENT.STULASTNAME}} {{en.STUDENT.STUFIRSTNAME}}</a></td>
	                                                    <td style="color: {{gender[1]}}">{{gender[0]}}</td>
	                                                    <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>        
	                                                	<td><a href="#" ng-click="backToNotEnroll(en.STUDENT.STUID)"><span class="glyphicon glyphicon-transfer "></span></a></td>
	                                                </tr>  
	                                            </tbody>
	                                        </table>
	                                        <div style="text-align: center"><label id="noSelectClass">Select any class to fetch student information</label></div>
	                                        <div style="text-align: center;"><label id="noEnroll">No students enroll in this class</label></div>
	                                    </div>
	                                   </div>
                                    </form>
                                                          
								</div>
                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>     
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>