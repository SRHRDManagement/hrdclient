<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>KSHRD Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/static/css/style1.css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/core.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/components.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/icons.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/pages.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/resources/static/css/responsive.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/mycss.css" type="text/css">


		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/modernizr.custom.86080.js"></script>
    </head>
    <body id="page">
        <ul class="cb-slideshow">
            <li><span>Image 01</span><div><h3></h3></div></li>
            <li><span>Image 02</span><div><h3></h3></div></li>
            <li><span>Image 03</span><div><h3></h3></div></li>
            <li><span>Image 04</span><div><h3></h3></div></li>
            <li><span>Image 05</span><div><h3></h3></div></li>
            <li><span>Image 06</span><div><h3></h3></div></li>
        </ul>
        <div class="container">
            <!-- Codrops top bar -->
            
             <div class="wrapper-page">
            <div class=" card-box">
            <div class="panel-heading"> 
                <img class="img-responsive center-block" src="${pageContext.request.contextPath}/resources/static/images/hrdlogo.png">
                <h3 style="line-height: 10px;"class="text-center"><strong class="text-custom"><br/>SCHOOL MANAGEMENT SYSTEM</strong> </h3>
            </div> 


            <div class="panel-body">
            <form class="form-horizontal m-t-20" id="frmLogin" method="post">
                
                <div class="form-group ">
                    <div class="col-xs-12">
                        <input class="form-control" type="text" required="" placeholder="Username" name="usr_email">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <div class="input-group">
                            <input class="form-control" type="password" required="" placeholder="Password" name="usr_password">
                            <span class="input-group-btn">
                                <button class="btn btn-secondary" style="background-color: #fff; border-color: #d9d9d9;" type="button">Show</button>
                             </span>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <div class="col-xs-12">
                        <div class="checkbox pull-left checkbox-primary">
                            <input id="checkbox-signup" type="checkbox">
                            <label for="checkbox-signup">
                                Remember me
                            </label>
                        </div>
                        
                    </div>
                </div>
                
                <div class="form-group text-center m-t-40">
                    <div class="col-xs-12">
                        <button type="submit" class="btn btn-pink btn-block text-uppercase waves-effect waves-light" type="text">
                        Log In</button>
                    </div>
                </div>

                <div class="form-group m-t-30 m-b-0">
                    <div class="col-sm-12"> 
                        <a href="page-recoverpw.html" class="text-dark"><i class="fa fa-lock m-r-5"></i> Forgot your password?</a>
                    </div>
                </div>
            </form> 
            
            </div>            
        </div>

        </div>

        <script>
            var resizefunc = [];
        </script>

          <!-- jQuery  -->
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/detect.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/fastclick.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.slimscroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.blockUI.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/waves.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/wow.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.nicescroll.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.scrollTo.min.js"></script>


        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.core.js"></script>
        <script src="${pageContext.request.contextPath}/resources/static/js/jquery.app.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        
        <script type="text/javascript">
        
        $(function() {
        	
        	$("#frmLogin").submit(function(e){
       		
       		  e.preventDefault();
       			
       		  $.ajax({
  	            url: "${pageContext.request.contextPath}/login",
  	            type: "POST",
  	            data: $("#frmLogin").serialize(),
  	            success: function(data) {
  	            	if(data == "User account is locked"){
  	            		alert(data);
  	            	}else if(data == "User is disabled"){
  	            		alert(data);
  	            	}else if(data == "Bad credentials"){
  	            		alert(data);
  	            	}else{
  	            		location.href = "${pageContext.request.contextPath}/"+ data;
  	            		console.log("${pageContext.request.contextPath}/"+ data);
  	            	}
  	            	
  	            },
  	         	error: function(data){
  	         		console.log(data);
  				}
  	        });
       			
       		}); 
        });
        </script>
        
    </body>
</html>