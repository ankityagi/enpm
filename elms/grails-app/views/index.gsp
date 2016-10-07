<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>ELMS | Login Page</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	
	<link href="${resource(dir: 'plugins/bootstrap/css', file: 'bootstrap.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'plugins/font-awesome/css', file: 'font-awesome.min.css')}" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->	
	<!-- ================== END BASE JS ================== -->
</head>

<body>
    <!-- begin #page-container -->
	<div class="container" id="page-container">
	<!-- begin login -->
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header">
                  <h1>Welcome to ELMS <small>The learning center</small></h1>
                </div>
            </div>
        </div>


            <div class="login-content">
                <form action='${createLink(uri: '/j_spring_security_check')}' method='POST' id='loginForm' class="margin-bottom-0" autocomplete='off'>
                	<g:if test='${flash.error}'>
	                	<div class="alert alert-danger fade in m-b-155">
									${flash.error}
							<span class="close" data-dismiss="alert">&times;</span>
						</div>
					</g:if>
					<g:if test='${flash.message}'>
	                	<div class="alert alert-success fade in m-b-155">
									${flash.message}
							<span class="close" data-dismiss="alert">&times;</span>
						</div>
					</g:if>
                    <div class="form-group m-b-20">                        
                        <input type="email" id="username" class="text_ form-control" name="j_username" placeholder="Email address" required autofocus>
                    </div>
                    <div class="form-group m-b-20">                        
                        <input type="password" id="password" class="text_ form-control" name="j_password" placeholder="Password" required>
                    </div>
                    <div class="checkbox m-b-20">
                        <label>
                            <input name="_spring_security_remember_me" type="checkbox" /> Remember Me
                        </label>
                        <g:link controller="register" action="forgotPassword" class="pull-right">Forgot Password</g:link>.
                    </div>
                    <div class="login-buttons">                        
                        <button class="btn btn-primary btn-block btn-lg" type="submit">Sign	in</button>
                    </div>
                </form>
            </div>
      </div>
        
       
</div>
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${resource(dir: 'plugins/jquery', file: 'jquery-3.1.1.min.js')}"></script>
	<script src="${resource(dir: 'plugins/bootstrap/js', file: 'bootstrap.min.js')}"></script>
	<!-- ================== END BASE JS ================== -->
	<!-- ================== END PAGE LEVEL JS ================== -->
</body>
</html>




