<jsp:include page="header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/static/js/staffListAngular.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/css/studentStyle.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-filestyle/src/bootstrap-filestyle.min.js" type="text/javascript"></script>
<style>
	label b{color:red;}
</style>
    <div class="content-page" ng-app="staffListApp" ng-controller="staffListCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">STAFF</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Staff</a></li>
                            <li class="active">Staff List</li>
                        </ol>
                    </div>
                </div>
                
				<div class="row" id="staffList">
					<div class="col-sm-12">
						<div class="card-box">
							<h4 class="m-t-0 header-title"><b>STAFF LIST</b></h4>
							<!-- <p class="text-muted font-13">you can click on student name to his or her timeline.</p> -->
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
                                      <th>Avatar</th>
                                      <th>FullName</th>
                                      <th>Gender</th>
                                      <th>Phone</th>
                                      <th>Status</th>
                                  	</tr>
							    </thead>
							    <tbody>
							        <tr dir-paginate="sta in staffs| filter: searchKeyword | itemsPerPage:7" ng-init="gender=fillGender(sta.STAGENDER); themeStatus=selectThemeStatus(sta.STASTATUS); themePhoto=selectThemePhoto(sta.STAAVATAR);">
                                      <td><a ng-click="getStaffById(sta.STAID)" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#staff-modal"><i class="fa fa-pencil"></i></a></td>
                                      <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
                                      <td><a href="#">{{sta.STALASTNAME}} {{sta.STAFIRSTNAME}}</a></td>
                                      <td style="color: {{gender[1]}}">{{gender[0]}}</td>
                                      <td>{{sta.STAPHONE}}</td>
                                      <td><button class="btn btn-xs {{themeStatus[0]}}"><span class="{{themeStatus[1]}}"></span></button></td>  
                                  </tr>
							    </tbody>
							</table>
							<div style="text-align: center">
								<dir-pagination-controls
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
	                        <h4 class="m-t-0 header-title"><b>add new staff</b></h4>
	                        <p class="text-muted font-13 m-b-30">
	                            Please fill all information to the control form.
	                        </p>
	
	                        <form action="#" data-parsley-validate novalidate name="frmGenerationInsert">
	                        <div class="row">
	
	                            <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInFirstName">FirstName<b>*</b></label>
                                        <div class="input-group">
											<input type="text" ng-model="staInFirstName" class="form-control" placeholder="Staff first name" id="staInFirstName" required name="staInFirstName">
											<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
										</div>
                                      </div>
                                  </div>
	
	                            <div class="col-sm-12 col-md-3 col-lg-2">
                                      <div class="form-group">
                                        <label for="staInLastName">LastName<b>*</b></label>
                                        <div class="input-group">
											<input type="text" ng-model="staInLastName" class="form-control" placeholder="Staff last name" id="staInLastName" required name="staInLastName">
											<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
										</div>
                                      </div>
                                  </div>
                                  
                                  <div class="col-sm-12 col-md-2 col-lg-2" style="text-align: center;">
                                    <div class="form-group" style="text-align: left">
                                        <label for="Gender">Gender<b>*</b></label>
                                    </div>
                                    <div class="radio radio-info radio-inline" ng-init="staInGender='m'">
                                        <input type="radio" value="m" name="staInGender" ng-model="staInGender">
                                        <label for="staInGender">Male</label>
                                    </div>
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" value="f" name="staInGender" ng-model="staInGender">
                                        <label for="staInGender">Female</label>
                                    </div>
                                 </div>
	
	                            <div class="col-sm-12 col-md-2 col-lg-2">
                                     <div class="form-group">
                                       <label for="staInPhone">Phone<b>*</b></label>
                                       <div class="input-group">
										<input type="text" ng-model="staInPhone" class="form-control" data-mask="(999)-999-999*" placeholder="Staff phone" id="staInPhone" required name="staInPhone">
										<span class="input-group-addon bg-inverse b-0 text-white"><i class="icon-user"></i></span>
									</div>
                                     </div>
                                 </div>
                                 
                                <div class="col-sm-12 col-md-6 col-lg-2">
                                <div class="form-group m-b-0">
                                <label for="staInPhone">Upload image</label>
									<input type="file" class="filestyle" data-buttonname="btn-primary" id="staAvatar" ng-model="staAvatar" name="staAvatar">
								</div>
								</div>
								<div class="col-sm-12 col-md-6 col-lg-1">
								<div class="form-group imgAvatar" style="text-align: center">
									<label for="sAvatar">Photo</label><br>
									<img class="img-rounded" style="height: 35px; border: 1px solid grey;"
										id="sAvatar" src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
									</div>
								</div>
	
	                            <div class="col-sm-12 col-md-1 col-lg-1">
	                                <div class="form-group text-center m-b-0">
	                                    <label>Click</label>
	                                    <button ng-click="addStaff()" ng-disabled="" class="btn btn-primary col-lg-12 waves-effect waves-light" type="button">Save</button>
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
        
<div id="staff-modal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Update Staff Information</h4>
            </div>
            <form action="#" name="frmUpdateStaff">
	            <div class="modal-body">
	                <div class="row">
              			<div class="col-sm-12 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label for="staUpFirstName">FirstName<b>*</b></label>
                                <div class="input-group">
								<input type="text" ng-model="staUpFirstName" class="form-control" placeholder="Staff first name" id="staUpFirstName" required name="staUpFirstName">
								<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-user"></i></span>
								</div>
                              </div>
                       </div>
                       
                       <div class="col-sm-12 col-md-5 col-lg-5">
                              <div class="form-group">
                                <label for="staUpLastName">LastName<b>*</b></label>
                                <div class="input-group">
								<input type="text" ng-model="staUpLastName" class="form-control" placeholder="Staff last name" id="staUpLastName" required name="staUpLastName">
								<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-user"></i></span>
								</div>
                              </div>
                       </div>
                       
                       <div class="col-sm-12 col-md-2 col-lg-2">
                                    <div class="form-group">
                                        <label for="Gender">Gender<b>*</b></label>
                                    </div>
                                    <div style="text-align: center;">
                                    <div class="radio radio-info radio-inline" ng-init="staUpGender='m'">
                                        <input type="radio" value="m" name="staUpGender" ng-model="staUpGender">
                                        <label for="staUpGender">M</label>
                                    </div>
                                    <div class="radio radio-info radio-inline">
                                        <input type="radio" value="f" name="staUpGender" ng-model="staUpGender">
                                        <label for="staUpGender">F</label>
                                    </div>
                                    </div>
                                 </div>
	
	                            <div class="col-sm-12 col-md-5 col-lg-5">
                                     <div class="form-group">
                                       <label for="staUpPhone">Phone<b>*</b></label>
                                       <div class="input-group">
										<input type="text" ng-model="staUpPhone" class="form-control" data-mask="(999)-999-999*" placeholder="Staff phone" id="staUpPhone" required name="staUpPhone">
										<span class="input-group-addon bg-pink b-0 text-white"><i class="icon-user"></i></span>
									</div>
                                     </div>
                                 </div>
                                 
                                 <div class="col-sm-12 col-md-5 col-lg-5">
                                <div class="form-group m-b-0">
                                <label for="staUpAvatar">Upload image</label>
									<input type="file" class="filestyle" data-buttonname="btn-primary" id="staUpAvatar" ng-model="staUpAvatar" name="staUpAvatar">
								</div>
								
								</div>
								<div class="col-sm-12 col-md-2 col-lg-2">
								<div class="form-group" style="text-align: center;">
									<label for="sUpAvatar">Photo</label><br>
									<img class="img-rounded" style="width: 30%; height: 35px; border: 1px solid grey;"
										id="sUpAvatar" src="${pageContext.request.contextPath}/resources/static/images/default-profile.png" />
									</div>
								</div>
                       
	            </div>
	            <div class="modal-footer">
	                <button ng-click="updateStaff()" ng-disabled="" type="button" data-dismiss="modal" class="btn btn-pink waves-effect waves-light">Update</button>
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