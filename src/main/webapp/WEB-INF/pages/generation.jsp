<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/plugins/custombox/dist/custombox.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/static/css/generationStyle.css" rel="stylesheet">
<div class="content-page" ng-app="generationApp" ng-controller="generationCtr">
    <!-- Start content -->
    <div class="content">
        <div class="container">

            <!-- Page-Title -->
            <div class="row">
                <div class="col-sm-12">
                    <h4 class="page-title">Generation</h4>
                    <ol class="breadcrumb">
                        <li><a href="#">Study Management</a></li>
                        <li class="active">Generation</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="card-box">
                        <div class="row">

                            <div class="col-md-3" ng-repeat="gen in generations | orderBy:'GENID'">
                                <div class="portlet" ng-init="tapTheme=selectTheme(gen.GENISFINISH)">
                                    <div class="portlet-heading {{tapTheme[0]}}" style="box-shadow:2px 2px 6px rgba(35, 35, 40, 0.83)">
                                        <h3 class="portlet-title">{{gen.GENNAME}}</h3>
                                        <div class="portlet-widgets">
                                            <a class="{{tapTheme[1]}}" ng-click="getGenerationById(gen.GENID)" data-animation="blur" data-plugin="custommodal" data-overlaySpeed="100" data-overlayColor="#36404a" data-toggle="modal" href="#generation-modal"><i class="fa fa-pencil"></i></a>
                                            <span class="divider"></span>
                                            <a class="{{tapTheme[1]}}" ng-click="disableGeneration(gen.GENID)" href="#"><i class="md {{tapTheme[2]}}"></i></a>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div id="bg-custom" class="panel-collapse collapse in" style="box-shadow:2px 2px 6px rgba(35, 35, 40, 0.83)">
                                        <div class="portlet-body">
                                            <table class="table table-no-bordered">
                                                <tbody>
                                                    <tr class="genCenter"><th>Start date:</th><th>{{gen.GENSTARTDATE}}</th></tr>
                                                    <tr class="genCenter"><th>End date:</th><th>{{gen.GENENDDATE}}</th></tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="courseNotFound" style="display: none"><h1 style="text-align: center">Never create Generation!</h1></div>

                        </div> <!-- End row -->
                        <div class="col-lg-offset-11">
                            <button value="plus" class="btn btn-primary waves-effect waves-light" type="button" id="plusButton" ng-click="showAddGeneration()"><i id="plusicon" class="glyphicon glyphicon-plus-sign"></i></button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row" id="generation-layout" style="display:none;">
                <div class="col-md-12">
                    <div class="card-box">
                        <h4 class="m-t-0 header-title"><b>add new generation</b></h4>
                        <p class="text-muted font-13 m-b-30">
                            Please fill all information to the control form.
                        </p>

                        <form action="#" data-parsley-validate novalidate name="frmGenerationInsert">
                        <div class="row">

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>NAME <span style="color: red">*</span></label>
                                    <input type="text" required ng-model="txtGenName" placeholder="Generation Name"  class="form-control"  name="txtGenName">
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>START <span style="color: red">*</span></label>
                                    <div class="input-group">
										<input type="text" ng-model="txtStartDate" class="form-control" placeholder="year-month-day" id="dpStartDateUpdate" required name="txtStartDate" >
										<span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
									</div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label>END <span style="color: red">*</span></label>
                                    <div class="input-group">
										<input type="text" ng-model="txtEndDate" class="form-control" placeholder="year-month-day" id="dpEndDateUpdate" required name="txtEndDate">
										<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
									</div>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group text-center m-b-0">
                                    <label>Click here to Add</label>
                                    <button ng-click="addGeneration()" ng-disabled="disableAddGenerationButton || frmGenerationInsert.txtGenName.$invalid || frmGenerationInsert.txtStartDate.$invalid || frmGenerationInsert.txtEndDate.$invalid" class="btn btn-primary col-lg-12 waves-effect waves-light" type="button">Save</button>
                                </div>
                            </div>
                            
                          </div>
                        </form>
                    </div>
                </div>
            </div>

        </div> <!-- container -->
    </div> <!-- content -->
    
    <div id="generation-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">Update Generation</h4>
            </div>
            <form action="#" name="frmUpdateGeneration">
	            <div class="modal-body">
	                <div class="row">
	                    <div class="col-md-12">
	                         <div class="form-group">
	                             <label>NAME <span style="color: red">*</span></label>
	                             <input type="text" required ng-model="newGenName" placeholder="New Generation Name"  class="form-control"  name="newGenName">
	                         </div>
	                    </div>
	                    <div class="col-md-6">
		                    <div class="form-group">
		                        <label>START <span style="color: red">*</span></label>
		                        <div class="input-group">
									<input type="text" ng-model="newGenStartDate" class="form-control" placeholder="year-month-day" id="dpStartDate" required name="newGenStartDate" >
									<span class="input-group-addon bg-custom b-0 text-white"><i class="icon-calender"></i></span>
								</div>
	                          </div>
	                      </div>
	                      <div class="col-md-6">
		                    <div class="form-group">
		                        <label>END <span style="color: red">*</span></label>
		                        <div class="input-group">
									<input type="text" ng-model="newGenEndDate" class="form-control" placeholder="year-month-day" id="dpEndDate" required name="newGenEndDate" >
									<span class="input-group-addon bg-danger b-0 text-white"><i class="icon-calender"></i></span>
								</div>
	                          </div>
	                      </div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <button ng-click="updateGeneration()" ng-disabled="frmUpdateGeneration.newGenName.$invalid ||frmUpdateGeneration.newGenStartDate.$invalid ||frmUpdateGeneration.newGenEndDate.$invalid" type="button" data-dismiss="modal" class="btn btn-pink waves-effect waves-light">Update</button>
	            </div>
			</form>
        </div>
    </div>
</div><!-- /.modal -->

</div> <!-- end controller -->
</div>
<script src="${pageContext.request.contextPath}/resources/static/plugins/custombox/dist/custombox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/custombox/dist/legacy.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/plugins/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/generationAngular.js"></script>
<script src="${pageContext.request.contextPath}/resources/static/js/generationJquery.js"></script>
<jsp:include page="footer.jsp"></jsp:include>