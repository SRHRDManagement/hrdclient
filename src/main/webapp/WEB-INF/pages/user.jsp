<jsp:include page="header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/static/js/userAngular.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/studentStyle.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-filestyle/src/bootstrap-filestyle.min.js" type="text/javascript"></script>
<style>
	label b{color:red;}
</style>
    <div class="content-page" ng-app="userApp" ng-controller="userCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->
                
				<div class="row" id="staffList">
					<div class="col-sm-12">
						<div class="card-box">
							<h4 class="m-t-0 header-title"><b>USER LIST</b></h4>
							<p class="text-muted font-13">you can click ADD button under table to register new user.</p>
							<div class="col-md-offset-9 col-md-3">
							<div class="input-group" style="margin-bottom: 5px">
								<input type="text" ng-model="searchKeyword" class="form-control" placeholder="Search ..." id="searchKeyword" required name="searchKeyword">
								<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-magnifier"></i></span>
							</div>
							</div>
							<table class="table tablesaw">
							    <thead>
							        <tr>
                                      <th><span class="glyphicon glyphicon-cog"></span></th>
                                      <th>Photo</th>
                                      <th>FullName</th>
                                      <th>Email</th>
                                      <th>Role</th>
                                      <th>Gender</th>
                                      <th>Phone</th>
                                      <th>Date</th>
                                      <th>Status</th>
                                  	</tr>
							    </thead>
							    <tbody>
							        <tr dir-paginate="usr in users| filter: searchKeyword | itemsPerPage:7" pagination-id="paginate1" ng-init="gender=fillGender(usr.USRGENDER); themeStatus=selectThemeStatus(usr.USRSTATUS); themePhoto=selectThemePhoto(usr.USRAVATAR); roleTheme=selectRoleTheme(usr.ROLE_ID);">
                                      <td><a ng-click="getStaffById(usr.USRID)" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#staff-modal"><i class="fa fa-pencil"></i></a></td>
                                      <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
                                      <td><a href="#">{{usr.USRLASTNAME}} {{usr.USRFIRSTNAME}}</a></td>
                                      <td>{{usr.EMAIL}}</td>
                                      <td style="color: {{roleTheme[1]}}">{{roleTheme[0]}}</td>
                                      <td style="color: {{gender[1]}}">{{gender[0]}}</td>
                                      <td>{{usr.USRPHONE}}</td>
                                      <td>{{usr.USRDATE}}</td>
                                      <td><button class="btn btn-xs {{themeStatus[0]}}"><span class="{{themeStatus[1]}}"></span></button></td>  
                                  </tr>
							    </tbody>
							</table>
							<div style="text-align: center">
								<dir-pagination-controls
									pagination-id="paginate1"
							       max-size="7"
							       direction-links="true"
							       boundary-links="true" >
							    </dir-pagination-controls>
							</div><hr>
							<div class="col-lg-offset-11">
	                      		<button value="plus" class="btn btn-primary waves-effect waves-light" type="button" id="plusButton" ng-click="showAddStaff()"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
	                  		</div>
						</div>
					</div>
				</div>
						
				<!-- ========== start body update ========== -->
	            <div class="row" id="staff-layout" style="display: none">
	                <div class="col-md-12">
	                    <div class="card-box">
	                        <h4 class="m-t-0 header-title"><b>register new user</b></h4>
	                        <p class="text-muted font-13 m-b-30">Please fill all information to the control form.</p>
	
	                        <form action="#" data-parsley-validate novalidate name="frmUser">
		                        <div class="row">
		                        
		                        	<div class="col-sm-12 col-md-6 col-lg-6">
		                        		<div class="col-md-8 col-lg-8"><h4>Staff list</h4></div>
				                        <div class="input-group col-md-4 col-lg-4" style="margin-bottom: 5px">
										<input type="text" ng-model="searchStaff" class="form-control" placeholder="Search staff ..." required name="searchStaff">
										<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-magnifier"></i></span>
									</div>
			                            <table class="table tablesaw">
			                            	<thead>
			                            		<tr><th>Photo</th><th>FullName</th><th>Gender</th><th><span class="fa  fa-user-plus"></span> Register</th></tr>
			                            	</thead>
			                            	<tbody>
			                            		<tr dir-paginate="sta in staffs| filter: searchStaff | itemsPerPage:7" pagination-id="paginate2" ng-init="gender=fillGender(sta.STAGENDER); themeStatus=selectThemeStatus(sta.STASTATUS); themePhoto=selectThemePhoto(sta.STAAVATAR);">
			                            			<td><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></td>
			                            			<td>{{sta.STALASTNAME}} {{sta.STAFIRSTNAME}}</td>
			                            			<td style="color: {{gender[1]}}">{{gender[0]}}</td>
			                            			<td><button type="button" ng-click="getStaffInfo(sta.STAID)" class="btn btn-success" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#user-modal"><span class="glyphicon glyphicon-user"></span></button></td>
			                            		</tr>
			                            	</tbody>
			                            </table>
			                            <div style="text-align: center">
											<dir-pagination-controls
							       				max-size="7"
							       				pagination-id="paginate2"
							       				direction-links="true"
							       				boundary-links="true" >
							    			</dir-pagination-controls>
									</div><hr>
		                            </div>
		                            
		                           <div class="col-sm-12 col-md-6 col-lg-6">
		                        		<div class="col-md-8 col-lg-8"><h4>Student list</h4></div>
				                        <div class="input-group col-md-4 col-lg-4" style="margin-bottom: 5px">
										<input type="text" ng-model="searchStudent" class="form-control" placeholder="Search student ..." required name="searchStudent">
										<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-magnifier"></i></span>
									</div>
			                            <table class="table tablesaw">
			                            	<thead>
			                            		<tr><th>Photo</th><th>FullName</th><th>Gender</th><th><span class="fa  fa-user-plus"></span> Register</th></tr>
			                            	</thead>
			                            	<tbody>
			                            		<tr dir-paginate="stu in students| filter: searchStudent| itemsPerPage:7" pagination-id="paginate3" ng-init="gender=fillGender(stu.STUGENDER); themeStatus=selectThemeStatus(stu.STUSTATUS); themePhoto=selectThemePhoto(stu.STUAVATAR);">
			                            			<td><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></td>
			                            			<td>{{stu.STULASTNAME}} {{stu.STUFIRSTNAME}}</td>
			                            			<td style="color: {{gender[1]}}">{{gender[0]}}</td>
			                            			<td><button type="button" ng-click="getStudentInfo(stu.STUID)" class="btn btn-success" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#user-modal"><span class="glyphicon glyphicon-user"></span></button></td>
			                            		</tr>
			                            	</tbody>
			                            </table>
			                            <div style="text-align: center">
											<dir-pagination-controls
							       				max-size="7"
							       				pagination-id="paginate3"
							       				direction-links="true"
							       				boundary-links="true" >
							    			</dir-pagination-controls>
									</div><hr>
		                            </div>
		                            
		                          </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
                <!-- ========== end body content ========== -->	
                
            </div>
        </div>
        
<div id="user-modal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Register <b style="color: blue;">{{lastname}} {{firstname}}</b></h4>
            </div>
            <form action="#" name="frmStaffUser">
	            <div class="modal-body">
	                <div class="row">
              			<div class="col-sm-12 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label for="usrEmail">Email<b>*</b></label>
                                <div class="input-group">
								<input type="text" ng-model="usrEmail" class="form-control" placeholder="example@gmail.com ..." id="usrEmail" required name="usrEmail" ng-pattern="/^[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i">
								<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-user"></i></span>
								</div>
                              </div>
                       </div>
                       
                       <div class="col-sm-12 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label for="usrPassword">Password<b>*</b> (Default: hrd12345)</label>
                                <div class="input-group">
								<input type="password" ng-model="usrPassword" class="form-control" id="usrPassword" required name="usrPassword">
								<span class="input-group-addon bg-primary b-0 text-white"><i class="icon-user"></i></span>
								</div>
                              </div>
                       </div>
                       					
                     	<div class="col-sm-12 col-md-2 col-lg-2">
							<div class="form-group" style="text-align: center;">
								<label for="sAvatar">Photo</label><br>
								<img class="img-rounded" style="width: 30%; height: 35px; border: 1px solid grey;"
								id="sAvatar" src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
							</div>
						</div>
						
						<div class="col-sm-12 col-md-12 col-lg-12" style="text-align: center;">
                            <div style="text-align: center;">
	                            <div class="radio radio-success radio-inline">
	                                <input type="radio" value="1" name="roleId" ng-model="roleId" id="rdAdm">
	                                <label class="label label-success" for="roleId">ADMIN</label>
	                            </div>
	                            <div class="radio radio-pink radio-inline">
	                                <input type="radio" value="2" name="roleId" ng-model="roleId" id="rdIns">
	                                <label class="label label-pink" for="roleId">INSTRUCTOR</label>
	                            </div>
	                            <div class="radio radio-warning radio-inline">
	                                <input type="radio" value="3" name="roleId" ng-model="roleId" id="rdStu">
	                                <label class="label label-warning" for="roleId">STUDENT</label>
	                            </div>
                            </div>
						</div>
						
					</div>
	            </div>
	            <div class="modal-footer">
	                <button ng-click="addUser()" ng-disabled="frmStaffUser.usrEmail.$invalid" type="button" data-dismiss="modal" class="btn btn-success waves-effect waves-light">Register Now</button>
	            </div>
			</form>
        </div>
    </div>
</div><!-- /.modal -->
        
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-inputmask/bootstrap-inputmask.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/dirPagination.js"></script>
<jsp:include page="footer.jsp"></jsp:include>