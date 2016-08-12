<jsp:include page="header.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/resources/static/js/studentListAngular.js"></script>
<link href="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-table/dist/bootstrap-table.min.css" rel="stylesheet" type="text/css" />

    <div class="content-page" ng-app="studentListApp" ng-controller="studentListCtr">
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
                                <table id="example" class="tablesaw"
                                		data-toggle="table"
										data-search="true"
										data-show-columns="false"
										data-page-list="[5, 10, 20]"
										data-page-size="5"
										data-pagination="true" data-pagination="true" data-show-pagination-switch="true">
                                    <thead>
                                        <tr>
                                            <th><span class="glyphicon glyphicon-cog"></span></th>
                                            <th>Nº</th>
                                            <th>FullName</th>
                                            <th>Gender</th>
                                            <th>Birthdate</th>
                                            <th>phone</th>
                                            <th>Nationality</th>
                                        </tr>
                                    </thead>
                                    <tbody  style="color: #000" id="resultSubject">
                                        <tr ng-repeat="stu in students">
                                            <td><a ng-click="getSubjectById(subject.SUBID)" class="{{tapTheme[2]}}" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#subject-modal"><i class="fa fa-pencil"></i></a></td>
                                            <td>{{$index+1}}</td>
                                            <td>{{stu.STULASTNAME}} {{stu.STUFIRSTNAME}}</td>
                                            <td>{{stu.STUGENDER}}</td>
                                            <td>{{stu.STUDOB}}</td>
                                            <td>{{stu.STUPHONE}}</td>
                                            <td>{{stu.STUNATIONALITY}}</td>  
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
  <!--               <div class="row">
							<div class="col-sm-12">
								<div class="card-box">
									<h4 class="m-t-0 header-title"><b>STUDENT LIST</b></h4>
									<p class="text-muted font-13">you can click on student name to his or her timeline.</p>
									
									<table class="table tablesaw">
									    <thead>
									        <tr>
                                            <th><span class="glyphicon glyphicon-cog"></span></th>
                                            <th>Nº</th>
                                            <th>FullName</th>
                                            <th>Gender</th>
                                            <th>Birthdate</th>
                                            <th>phone</th>
                                            <th>Nationality</th>
                                        </tr>
									    </thead>
									    <tbody>
									        <tr ng-repeat="stu in students">
                                            <td><a ng-click="getSubjectById(subject.SUBID)" class="{{tapTheme[2]}}" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#subject-modal"><i class="fa fa-pencil"></i></a></td>
                                            <td>{{$index+1}}</td>
                                            <td>{{stu.STULASTNAME}} {{stu.STUFIRSTNAME}}</td>
                                            <td>{{stu.STUGENDER}}</td>
                                            <td>{{stu.STUDOB}}</td>
                                            <td>{{stu.STUPHONE}}</td>
                                            <td>{{stu.STUNATIONALITY}}</td>  
                                        </tr>
									    </tbody>
									</table>
									
								</div>
							</div>
						</div> -->
						
						
                
            </div>
        </div>
        
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-table/dist/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/pages/jquery.bs-table.js"></script>
<jsp:include page="footer.jsp"></jsp:include>