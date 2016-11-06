
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
            <div class="row">
                <g:render template="/shared/topbar" />
            </div>
            <div class="row">
                <div class="col-md-2">
                    <g:render template="/shared/sidebarCourse" />
                </div>
                <div class="col-md-10">
                    <div id="list-course" class="content scaffold-list" role="main">
                        <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                                <tr>
                                
                                    <th><g:message code="course.creator.label" default="Creator" /></th>
                                
                                    <th><g:message code="course.instructor.label" default="Instructor" /></th>
                                
                                    <g:sortableColumn property="role" title="My Role" />

                                    <g:sortableColumn property="name" title="${message(code: 'course.name.label', default: 'Name')}" />
                                
                                    <g:sortableColumn property="description" title="${message(code: 'course.description.label', default: 'Description')}" />
                                
                                    <g:sortableColumn property="dateCreated" title="${message(code: 'course.dateCreated.label', default: 'Date Created')}" />
                                
                                    <g:sortableColumn property="lastUpdated" title="${message(code: 'course.lastUpdated.label', default: 'Last Updated')}" />
                                
                                </tr>
                            </thead>
                            <tbody>
                            <g:each in="${courseListInstruc}" status="i" var="courseInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                
                                    <td><g:link action="coursehome" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "creator")}</g:link></td>
                                
                                    <td>${fieldValue(bean: courseInstance, field: "instructor")}</td>
                                
                                    <td>Instructor</td>

                                    <td>${fieldValue(bean: courseInstance, field: "name")}</td>
                                
                                    <td>${fieldValue(bean: courseInstance, field: "description")}</td>
                                
                                    <td><g:formatDate date="${courseInstance.dateCreated}" /></td>
                                
                                    <td><g:formatDate date="${courseInstance.lastUpdated}" /></td>
                                
                                </tr>
                            </g:each>
                            <g:each in="${courseList}" status="i" var="courseInstance">
                                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                
                                    <td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean: courseInstance, field: "creator")}</g:link></td>
                                
                                    <td>${fieldValue(bean: courseInstance, field: "instructor")}</td>
                                
                                    <td>${currentRole}</td>

                                    <td>${fieldValue(bean: courseInstance, field: "name")}</td>
                                
                                    <td>${fieldValue(bean: courseInstance, field: "description")}</td>
                                
                                    <td><g:formatDate date="${courseInstance.dateCreated}" /></td>
                                
                                    <td><g:formatDate date="${courseInstance.lastUpdated}" /></td>
                                
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
        <script>
        $(document).ready(function() {
            $('#dataTables-example').DataTable({
                responsive: true
            });
        });
        </script>
    </body>
</html>
