<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/subjectStyle.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/static/js/studentListAngular.js"></script>
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
                                <table class="tablesaw m-t-20 table m-b-0" data-tablesaw-mode="stack" data-page-list="[5, 10, 20]"
										   data-page-size="5">
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
            </div>
        </div>
        
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<jsp:include page="footer.jsp"></jsp:include>