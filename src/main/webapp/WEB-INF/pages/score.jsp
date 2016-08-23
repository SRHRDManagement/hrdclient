<jsp:include page="header.jsp"></jsp:include>
<link href="${pageContext.request.contextPath}/resources/static/css/studentEnrollStyle.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/static/js/scoreAngular.js"></script>
    <div class="content-page" ng-app="scoreApp" ng-controller="scoreCtr">
        <div class="content">
            <div class="container">
                <!-- ========== start body content ========== -->

                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box" style="min-height: 700px;">
                        	<div class="row">                       	
                        		<h3>SCORE</h3>
                        		<div class="col-md-2 col-lg-2">
                        		 	<div class="btn-group col-md-12 col-lg-12">
	                                      <button type="button" class="btn btn-primary dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{curMonth | uppercase}}</button>
	                                      <ul class="dropdown-menu" role="menu">
											<li ng-repeat="mon in months"><a href="#" ng-click="getMonthById(mon.MONID)">{{mon.MONNAME | uppercase}} </a></li>
	                                      </ul>
	                                 </div>
								</div>
								<div class="col-md-2 col-lg-2">
									<div class="btn-group col-md-12 col-lg-12">
	                                      <button type="button" class="btn btn-primary dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{curClassName|uppercase}} CLASS</button>
	                                      <ul class="dropdown-menu" role="menu">
	                                          <li ng-repeat="cla in classes"><a href="#" ng-click="getClassById(cla.CLAID)">{{cla.CLANAME | uppercase}} </a></li>
	                                      </ul>
	                                  </div>
	                             </div>
                        		 <div class="col-md-2 col-lg-2">
                        		 	<div class="btn-group col-md-12 col-lg-12">
	                                      <button type="button" class="btn btn-primary dropdown-toggle waves-effect waves-light col-md-12 col-lg-12" data-toggle="dropdown" aria-expanded="false">{{curSubjectName | uppercase}}</button>
	                                      <ul class="dropdown-menu" role="menu">
	                                         <li ng-repeat="sub in subjects"><a href="#" ng-click="getSubjectById(sub.SUBID)">{{sub.SUBNAME | uppercase}} </a></li>
	                                      </ul>
	                                 </div>
								</div>
                                  <form action="#" name="frmScore" method="post" novalidate>
	                                  <h1 class="m-t-0 header-title  col-lg-offset-10" style="text-align:center !important;"><button type="button" ng-disabled="frmScore.$invalid" ng-click="insertScore()" class="btn btn-success btn-rounded">SUBMIT SCORE</button></h1>
	                                  <div class="table-responsive" >
		                                <div class="col-sm-12">
		                                        <table id="datatable-buttons" class="table tablesaw" >
		                                            <thead>
		                                                <tr>
		                                                    <th class="col-md-1 col-lg-1">No</th>
		                                                    <th class="col-md-1 col-lg-1">Photo</th>
		                                                    <th class="col-md-2 col-lg-3">Student Name</th>
		                                                    <th class="col-md-2 col-lg-2">Gender</th>
		                                                    <th class="col-md-2 col-lg-2">Birthdate</th>
		                                                    <th class="col-md-3col-lg-3 center">Score</th>
		                                                    <th style="display: none;" class="col-md-1 col-lg-1"><label class="control control--checkbox center" style="transform: scale(1.5);">
															      <input type="checkbox" class="checkbox" id="selecct_all" value="{{stu.STUID}}" ng-click="studentSelected(stu.STUID)" name="cbbEnroll"/>
															      <div class="control__indicator" style="border-radius: 15px; background: grey;"></div>
															 </th>
		                                                </tr>
		                                            </thead>
			
		                                            <tbody>
		                                               <tr ng-repeat="sc in scores" ng-init="gender=fillGender(sc.student.STUGENDER); themePhoto=selectThemePhoto(sc.student.STUAVATAR); colorScore=selectColorScore(sc.SCOSCORE);">
		                                                     <td>{{$index+1}}</td>
		                                                     <td><a href="#"><img class="img-circle" src="{{imgUrl}}{{themePhoto}}" width="40" style="border: 1px solid grey; height: 40px;"/></a></td>
		                                                    <td><a href="#">{{sc.student.STULASTNAME}} {{sc.student.STUFIRSTNAME}}<input type="hidden" name="stuId[]" value="{{sc.student.STUID}}"></a></td>
		                                                    <td style="color: {{gender[1]}}">{{gender[0]}}</td>
		                                                    <td>{{sc.student.STUDOB}}</td>
															<td><input type="number" ng-min="0" ng-max="100" style="text-align: center; font-size: 1.2em; color: {{colorScore}}" class="form-control numberOnly" ng-change="autoSelect($index)" ng-model="sc.SCOSCORE" name="scoreNumber[]"></td>
		                                                	<td style="display: none;">
				                                            	<label class="control control--checkbox center" style="transform: scale(1.5);">
															      <input type="checkbox" class="checkbox" value="{{$index}}" name="cbbScore"/>
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