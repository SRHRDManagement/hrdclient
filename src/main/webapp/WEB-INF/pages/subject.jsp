<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/subjectStyle.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/static/js/subjectAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/subjectJquery.js"></script>
    <div class="content-page" ng-app="subjectApp" ng-controller="subjectCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">SUBJECT</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Study Management</a></li>
                            <li class="active">Subject</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <div>
                                <table class="tablesaw m-t-20 table m-b-0" data-tablesaw-mode="stack" id="tblSubject">
                                    <thead>
                                        <tr>
                                            <th><span class="glyphicon glyphicon-cog"></span></th>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Added date</th>
                                            <th>Description</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody  style="color: #000" id="resultSubject">
                                        <tr ng-repeat="subject in subjects" ng-init="tapTheme=selectTheme(subject.SUBACTIVE)" style="color: {{tapTheme[3]}}">
                                            <td><a ng-click="getSubjectById(subject.SUBID)" class="{{tapTheme[2]}}" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#subject-modal"><i class="fa fa-pencil"></i></a></td>
                                            <td>{{$index+1}}</td>
                                            <td>{{subject.SUBNAME}}</td>
                                            <td>{{subject.SUBDATE}}</td>
                                            <td>{{subject.SUBDESC}}</td>
                                            <td><button ng-click="disableSubject(subject.SUBID)" class="btn {{tapTheme[0]}} btn-xs">{{tapTheme[1]}}</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="subjectNotFound" style="display: none"><h1 style="text-align: center">Never create Subject!</h1></div>
                            </div><hr>
                            <div class="col-md-offset-11">
                                <button value="plus" ng-click="showAddSubjectForm()" class="btn btn-primary waves-effect waves-light" type="button" id="showAddSubjectButton"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
                <div class="row" id="subject-layout" style="display:none;">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><b>add new subject</b></h4>
                            <p class="text-muted font-13 m-b-30">
                                Please fill all information to the control form.
                            </p>

                            <form action="#" data-parsley-validate novalidate name="frmAddSubject">
                            <div class="row">

                                 <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="subName">SUBJECT NAME <span style="color: red">*</span></label>
                                        <input type="text" required placeholder="Course Name" ng-model="subName" id="subName" class="form-control" >
                                    </div>
                                </div>

                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="subDate">Date <span style="color: red">*</span></label>
                                         <div class="input-group">
											<input type="text" ng-model="subDate" class="form-control" placeholder="year-month-day" id="subDate" required name="subDate" >
											<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
										</div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="subDesc">DESCRIPTION</label>
                                        <div class="input-group">
											<input type="text" ng-model="subDesc" class="form-control" placeholder="description ..." id="subDesc" name="subDesc" >
											<span class="input-group-addon bg-custom b-0 text-white"><i class="ion-chatbubble-working"></i></span>
										</div>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="form-group text-center m-b-0">
                                        <label>Click here</label>
                                        <button ng-click="addSubject()" id="saveSubject" ng-disable="frmAddSubject." class="btn btn-primary col-md-12 waves-effect waves-light" type="button">Save</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
                <div id="subject-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		                <h4 class="modal-title">Update Class</h4>
		            </div>
		            <form action="#" name="frmUpdateSubject">
			            <div class="modal-body">
			                <div class="row">
			                    <div class="col-md-6">
			                         <div class="form-group">
			                             <label>NAME <span style="color: red">*</span></label>
			                             <input type="text" required ng-model="newSubName" placeholder="New subject Name"  class="form-control"  name="newSubName">
			                         </div>
			                    </div>
			                    <div class="col-md-6">
				                    <div class="form-group">
				                        <label>DATE <span style="color: red">*</span></label>
				                        <div class="input-group">
											<input type="text" ng-model="newSubDate" class="form-control" placeholder="year-month-day" id="newSubDate" required name="newSubDate" >
											<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
										</div>
			                          </div>
			                      </div>
			                      <div class="col-md-12">
				                    <div class="form-group">
				                        <label>DESCRIPTION</label>
				                        <div class="input-group">
											<input type="text" ng-model="newSubDesc" class="form-control" placeholder="description ..." id="newSubDesc" name="newSubDesc" >
											<span class="input-group-addon bg-custom b-0 text-white"><i class="ion-chatbubble-working"></i></span>
										</div>
			                          </div>
			                      </div>
			                </div>
			            </div>
			            <div class="modal-footer">
			                <button ng-click="updateSubject()" ng-disabled="frmUpdateSubject.newSubName.$invalid ||frmUpdateSubject.newSubDate.$invalid ||frmUpdateSubject.newSubDesc.$invalid" type="button" data-dismiss="modal" class="btn btn-pink waves-effect waves-light">Update</button>
			            </div>
					</form>
		        </div>
		    </div>
		</div><!-- /.modal -->
        
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<jsp:include page="footer.jsp"></jsp:include>