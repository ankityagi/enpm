
<%@ page import="elms.Course" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="container" id="main">
            <g:if test="${flash.message}">
                <div class="alert alert-success">
                    ${flash.message}
                </div>
            </g:if>
            <div class="row">
                <g:render template="/shared/topbar" />
            </div>
            <div class="row">
                <div class="col-md-2">
                    <g:render template="/shared/sidebarCourse" />
                </div>
                <div class="col-md-10">
                    <div class="row">
                        <div id="list-course" class="content scaffold-list" role="main">
                            <h1>${courseInstance?.name}</h1>
                            </br>
                            <h4>Announcements</h4>
                            
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                    <tr>
                                    
                                        <th><g:message code="course.creator.label" default="Creator" /></th>
                                    
                                        <th><g:message code="course.instructor.label" default="Instructor" /></th>
                                    
                                        <g:sortableColumn property="role" title="Announcement Name" />
                                    
                                        <g:sortableColumn property="dateCreated" title="${message(code: 'course.dateCreated.label', default: 'Date Created')}" />
                                    </tr>
                                </thead>
                                <tbody>
                                <g:each in="${courseAnnouncements}" status="i" var="announcementInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    
                                        <td><g:link controller="announcement" action="show" id="${announcementInstance.id}">${announcementInstance?.creator}</g:link></td>
                                    
                                        <td>${courseInstance?.instructor}</td>
                                    
                                        <td><g:link controller="announcement" action="show" id="${announcementInstance.id}">${announcementInstance?.name}</g:link></td>
                                    
                                        <td><g:formatDate date="${announcementInstance.dateCreated}" /></td>
                                    
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <g:paginate total="${courseInstanceCount ?: 0}" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div id="list-course" class="content scaffold-list" role="main">
                            <h4>Assignments</h4>
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                    <tr>
                                    
                                        <th><g:message code="course.creator.label" default="Creator" /></th>
                                    
                                        <th><g:message code="course.instructor.label" default="Instructor" /></th>
                                    
                                        <g:sortableColumn property="role" title="Announcement Name" />
                                    
                                        <g:sortableColumn property="dateCreated" title="${message(code: 'course.dateCreated.label', default: 'Date Created')}" />

                                       <!--  <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                                            <th> Instructor Action </th>
                                        </g:if>
                                        <g:else>
                                            <th> Student Action </th>
                                        </g:else> -->
                                    </tr>
                                </thead>
                                <tbody>
                                <g:each in="${courseAssignments}" status="i" var="assignmentInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                    
                                        <td><g:link controller="assignment" action="show" id="${assignmentInstance.id}" params="${[courseId: courseInstance?.id]}">${assignmentInstance?.creator}</g:link></td>
                                    
                                        <td>${courseInstance?.instructor}</td>
                                    
                                        <td><g:link controller="assignment" action="show" id="${assignmentInstance.id}" params="${[courseId: courseInstance?.id]}">${assignmentInstance?.name}</g:link></td>
                                    
                                        <td><g:formatDate date="${assignmentInstance.dateCreated}" /></td>
                                        
                                        <!-- <g:if test="${currentRole=='admin' || currentRole=='instructor'}">
                                            <td><g:link controller="assignment" action="grade" id="${assignmentInstance.id}"><button class="btn btn-default">Grade</button></g:link></td>
                                        </g:if>
                                        <g:else>
                                            <td><g:link controller="assignment" action="submitAssignment" id="${assignmentInstance.id}"><button class="btn btn-default">Sumbit</button></g:link></td>
                                        </g:else> -->
                                    
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                            <div class="pagination">
                                <g:paginate total="${courseInstanceCount ?: 0}" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
        </script>
    </body>
</html>
