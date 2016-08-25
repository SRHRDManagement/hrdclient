<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/classStyle.css" rel="stylesheet">
    <div class="content-page" ng-app="monthlyResultApp" ng-controller="monthlyResultCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-md-12">
                        <h4 class="page-title">Result</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Score</a></li>
                            <li class="active">Monthly Result</li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
								
									                                  <div class="table-responsive" >
		                                <div class="col-sm-12">
		                                        <table id="datatable-buttons" class="table tablesaw" >
		                                            <thead>
		                                                <tr>
		                                                    <th class="center">No</th>
		                                                    <th class="center">Student Name</th>
		                                                    <th class="center">Gender</th>
		                                                    <th class="center">ClassRoom</th>
		                                                    <th class="center">Java</th>
		                                                    <th class="center">Web</th>
		                                                    <th class="center">Korean</th>
		                                                    <th class="center">Attendance</th>
		                                                </tr>
		                                            </thead>
			
		                                            <tbody>
		                                               <tr ng-repeat="rep in reports" ng-init="gender=fillGender(rep.stu_gender)">
		                                                     <td>{{$index+1}}</td>
		                                                    <td><a href="#">{{rep.stu_lastname}} {{rep.stu_firstname}}</a></td>
		                                                    <td style="color: {{gender[1]}}">{{gender[0]}}</td>
		                                                    <td>{{rep.cla_name}}</td>
		                                                    <td>{{rep.java}}</td>
		                                                    <td>{{rep.web}}</td>
		                                                    <td>{{rep.korean}}</td>
		                                                    <td>{{rep.attendance}}</td>
		                                                </tr>  
		                                            </tbody>
		                                        </table>
		                                    </div>
	                                   </div>
								
                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>      
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/monthlyResultAngular.js"></script>
<jsp:include page="footer.jsp"></jsp:include>