<!-- Navigation -->
<nav class="navbar navbar-default" role="navigation" style="margin-bottom: 0">
    <div class="navbar-default" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="${createLink(controller:'home', action:'index')}"><i class="fa fa-dashboard fa-fw"></i> Home</a>
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'announcement', action:'create', params:[id:courseInstance?.id])}"><i class="fa fa-table fa-fw"></i> Create Announcement</a>
                    </g:if>
                    <g:else>
                        <a href="${createLink(controller:'announcement', action:'create')}"><i class="fa fa-table fa-fw"></i> Announcement</a>
                    </g:else>
                </li>
                <li>
                    <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Modules</a>
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'assignment', action:'create', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> Create Assignments</a>
                    </g:if>
                    <g:else>
                        <a href="${createLink(controller:'assignment', action:'index', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> Assignments</a>
                    </g:else>
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'assignment', action:'allGrades', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> All Assignments</a>
                    </g:if>
                    <g:else>
                        <a href="${createLink(controller:'assignment', action:'myGrades', params:[courseId:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> My Grades</a>
                    </g:else>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>
