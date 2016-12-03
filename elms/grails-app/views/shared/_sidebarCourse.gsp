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
                   
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'module', action:'create', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> Create Module</a>
                    </g:if>
                   
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'assignment', action:'create', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> Create Assignments</a>
                    </g:if>
                    
                </li>
                <li>
                    <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                        <a href="${createLink(controller:'assignment', action:'allGrades', params:[id:courseInstance?.id])}"><i class="fa fa-edit fa-fw"></i> Class Roster</a>
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
