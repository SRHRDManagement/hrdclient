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

                        </div>
                    </div>
                </div>
                <!-- ========== end body content ========== -->
            </div>
        </div>      
    </div>
</div>
<script src="${pageContext.request.contextPath}/resources/static/js/classAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/classJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>