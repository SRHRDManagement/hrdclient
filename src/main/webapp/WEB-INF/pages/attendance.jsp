<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/studentEnrollStyle.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/static/js/attendanceAngular.js"></script>
    <div class="content-page" ng-app="attendanceApp" ng-controller="attendanceCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box" style="min-height: 700px;">
                        	<div class="row">                       	
                        		<h3>CHECK ATTENDANCE</h3>
                        		 <div class="col-md-2 col-lg-2"><input type="text" ng-change="setToday(toDay)" ng-model="toDay" id="att_date" class="form-control" style="text-align: center;"></div>
                        		 <div class="col-md-2 col-lg-2">
                        		 	<div class="btn-group col-md-12 col-lg-12">
	                                      <button type="button" class="btn btn-white dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{getShift | uppercase}}</button>
	                                      <ul class="dropdown-menu" role="menu">
	                                          <li><a href="#" ng-click="setShift('Morning')">MORNING </a></li>
	                                          <li><a href="#" ng-click="setShift('Afternoon')">AFTERNOON </a></li>
	                                      </ul>
	                                 </div>
									<!-- <select class="form-control" id="att_shift" style="text-align: center;"><option>Morning</option><option>Afternoon</option></select> -->
								</div>
									<div class="col-md-2 col-lg-2">
									<div class="btn-group col-md-12 col-lg-12">
	                                      <button type="button" class="btn btn-white dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{newClaName|uppercase}} CLASS</button>
	                                      <ul class="dropdown-menu" role="menu">
	                                          <li ng-repeat="cla in classes"><a href="#" ng-click="getClassById(cla.CLAID)">{{cla.CLANAME | uppercase}} </a></li>
	                                      </ul>
	                                  </div></div>
                                  <form action="#" name="frmEnroll" method="post">
	                                  <h1 class="m-t-0 header-title  col-lg-offset-10" style="text-align:center !important;"><button type="button" ng-click="submitAttendance()" class="btn btn-success btn-rounded">SUBMIT ATTENDANCE</button></h1>
	                                  <div class="table-responsive" >
		                                <div class="col-sm-12">
		                                        <table id="datatable-buttons" class="table tablesaw" >
		                                            <thead>
		                                                <tr>
		                                                    <th class="col-md-1 col-lg-1">No</th>
		                                                    <th class="col-md-1 col-lg-1">Photo</th>
		                                                    <th class="col-md-2 col-lg-2">Student Name</th>
		                                                    <th class="col-md-1 col-lg-1">Gender</th>
		                                                    <th class="col-md-4 col-lg-4 center">Attendance type</th>
		                                                    <th class="col-md-2 col-lg-2"><input type="text" class="form-control" placeholder="the same reason ..."></th>
		                                                    <th style="display: none" class="col-md-1 col-lg-1"><label class="control control--checkbox center" style="transform: scale(1.5);">
															      <input type="checkbox" class="checkbox" id="selecct_all" value="{{stu.STUID}}" ng-click="studentSelected(stu.STUID)" name="cbbEnroll"/>
															      <div class="control__indicator" style="border-radius: 15px; background: grey;"></div>
															 </th>
		                                                </tr>
		                                            </thead>
			
		                                            <tbody>
		                                               <tr ng-repeat="en in studentsAttendance" ng-init="gender=fillGender(en.STUGENDER); themePhoto=selectThemePhoto(en.STUAVATAR);">
		                                                     <td>{{$index+1}}</td>
		                                                     <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
		                                                    <td><a href="#">{{en.STULASTNAME}} {{en.STUFIRSTNAME}}<input type="hidden" name="stuId[]" value="{{en.attendance.STUID}}"></a></td>
		                                                    <td style="color: {{gender[1]}}">{{gender[0]}}</td>
		                                                	<td>
																<div style="text-align: center;">
										                            <div class="radio radio-success radio-inline">
										                                <input type="radio" value="1" ng-change="autoSelect($index, 1)" name="roleId[{{$index}}]" ng-model="en.attendance.ABSID">
										                                <label class="label label-success">Permission</label>
										                            </div>
										                            <div class="radio radio-purple radio-inline">
										                                <input type="radio" value="2" ng-change="autoSelect($index, 2)" name="roleId[{{$index}}]" ng-model="en.attendance.ABSID">
										                                <label class="label label-purple">Late</label>
										                            </div>
										                            <div class="radio radio-danger radio-inline">
										                                <input type="radio" value="3" ng-change="autoSelect($index, 3)" name="roleId[{{$index}}]" ng-model="en.attendance.ABSID">
										                                <label class="label label-danger">Absent</label>
										                            </div>
										                            <div class="radio radio-inverse radio-inline">
										                                <input type="radio" value="4" ng-change="autoSelect($index, 4)" name="roleId[{{$index}}]" ng-model="en.attendance.ABSID">
										                                <label class="label label-inverse">Delete</label>
										                            </div>
									                            </div>
															</td>
															<td><input disabled type="text" class="form-control inputReason" ng-change="autoSelect($index)" ng-model="en.attendance.ATTREASON" name="reason[]" placeholder="here ..."></td>
		                                                	<td style="display: none">
				                                            	<label class="control control--checkbox center" style="transform: scale(1.5);">
															      <input type="checkbox" class="checkbox" value="{{$index}}" name="cbbAtt"/>
															      <div class="control__indicator"></div>
															    </label>
				                                        	</td>
		                                                </tr>  
		                                            </tbody>
		                                        </table>
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