<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Home</title>
    <meta name="layout" content="main" />
</head>

<body>
    <!-- Desktop Version -->
    <div class="container" id="main">
        <div class="row">
            <div class="col-lg-12">
                <g:if test="${currentUser.firstName==null}">
                    <h1>Welcome ${currentUser.email}</h1>
                </g:if>
                <g:else>
                    <h1>Welcome ${currentUser.firstName}</h1>
                </g:else>
            </div>
        </div>
        <div class="row">

        <g:if test="${currentRole=='admin'}">
            <!-- Admin Actions -->
            <div class="col-lg-12">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Select an action
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <h4>Admin Actions</h4>
                            <a class="btn btn-outline btn-primary btn-lg btn-block" href="${createLink(controller:'course', action:'index')}">
                                <i class="glyphicon glyphicon-eye-open"></i>&nbsp;View Courses</a>

                            <a class="btn btn-outline btn-primary btn-lg btn-block" href="${createLink(controller:'course', action:'create')}">
                                <i class="fa fa-magic"></i>&nbsp;Create Course</a>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>

        <!-- Instructor Actions -->
        <g:if test="${currentRole=='instructor'}">
            <div class="col-lg-12">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Select an action
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <h4>Instructor Actions</h4>
                            <a class="btn btn-outline btn-primary btn-lg btn-block" href="${createLink(controller:'course', action:'index')}">
                                <i class="glyphicon glyphicon-eye-open"></i>&nbsp;See Courses</a>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>

        <!-- Student Actions -->
        <g:if test="${currentRole=='student'}">
            <div class="col-lg-12">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Select an action
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <h4>Student Actions</h4>
                            <a class="btn btn-outline btn-primary btn-lg btn-block" href="${createLink(controller:'course', action:'index')}">
                                <i class="glyphicon glyphicon-eye-open"></i>&nbsp;My Courses</a>
                        </div>
                    </div>
                </div>
            </div>
        </g:if>

        <sec:ifLoggedIn>
        <!-- <g:remoteLink class="logout buttons" controller="logout"><g:message code="btn.logout"
                                                               default="Loading&hellip;"/></g:remoteLink> -->
    </sec:ifLoggedIn>

    </div>
    <style>
    .arc {
        fill: #00b33c;
    }
    
    .arc2 {
        fill: #d3d3d3;
    }
    
    .arc3 {
        fill: #196719;
    }
    </style>
</body>

</html>
