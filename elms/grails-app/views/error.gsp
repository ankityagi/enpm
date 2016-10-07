<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
	<meta charset="utf-8" />
	<title>Vulcan | 404 Error Page</title>
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="Vulcan: by Cylitix" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="${resource(dir: 'vulcan-new-ui/assets/plugins/jquery-ui/themes/base/minified', file: 'jquery-ui.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/plugins/bootstrap/css', file: 'bootstrap.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/plugins/font-awesome/css', file: 'font-awesome.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/css', file: 'animate.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/css', file: 'style.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/css', file: 'style-responsive.min.css')}" rel="stylesheet" />
	<link href="${resource(dir: 'vulcan-new-ui/assets/css/theme', file: 'orange.css')}" rel="stylesheet" id="theme" />
	<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/pace', file: 'pace.min.js')}"></script>
	<style type="text/css">
		body {
	    color: #000 !important;

		}
	</style>
	<!-- ================== END BASE JS ================== -->
</head>
<body class="pace-top">
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade"><span class="login-cover-image"><g:img dir="vulcan-new-ui/assets/img/login-bg" file="bg-1.jpg" data-id="login-cover-image" alt="" /></span>
	    <!-- begin error -->
        <div class="error">
            %{-- <div class="error-code m-b-10">404 <i class="fa 404-icon"><g:img dir="vulcan-new-ui/assets/img/icons" file="404-icon.png" /></i></div> --}%
            <div class="error-content">
            <g:if env="development">
				<g:renderException exception="${exception}" class="pull-left"/>
			</g:if>
			<g:else>

                <div class="error-message">We couldn't find it...</div>
                <div class="error-desc m-b-20">
                    The page you're looking for doesn't exist. <br />
                    Perhaps, these pages will help find what you're looking for.
                    <p>
				Please tell us what happend. Email us 
				<a href="mailto:contact@vulcan-sof.com?Subject=Lost my page" target="_top">here.</a>
                </div>
                
				</p>

            </g:else>

                <div>
                    <a href="javascript:;" onclick="goBack()" class="btn btn-primary">Go Back</a>
                </div>
            </div>
        </div>
        <!-- end error -->
        
       
        
		<!-- begin scroll to top btn -->
		<a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa scrollup-icon"></i></a>
		<!-- end scroll to top btn -->
	</div>
	<!-- end page container -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/jquery', file: 'jquery-1.9.1.min.js')}"></script>
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/jquery', file: 'jquery-migrate-1.1.0.min.js')}"></script>
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/jquery-ui/ui/minified', file: 'jquery-ui.min.js')}"></script>
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/bootstrap/js', file: 'bootstrap.min.js')}"></script>
	<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js')}"></script>
		<script src="assets/crossbrowserjs/respond.min.js')}"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js')}"></script>
	<![endif]-->
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/slimscroll', file: 'jquery.slimscroll.min.js')}"></script>
	<script src="${resource(dir: 'vulcan-new-ui/assets/plugins/jquery-cookie', file: 'jquery.cookie.js')}"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<script src="${resource(dir: 'vulcan-new-ui/assets/js', file: 'apps.min.js')}"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
		});
	</script>
	<script type="text/javascript">
		function goBack() {
			window.history.go(-1);
		}
	</script>
</body>
</html>
