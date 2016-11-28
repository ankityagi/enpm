
<%@ page import="elms.Announcement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <g:render template="/shared/topbar" />
            </div>
            <div id="show-assignment" class="content scaffold-show" role="main">
                <h1><strong>${announcementInstance?.name}</strong></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Date Created: <g:formatDate date="${assignmentInstance?.dateCreated}" type="date" style="short"/>  |  By: ${assignmentInstance?.creator}
                    </div>
                    <div class="panel-body">
                        ${assignmentInstance?.description}
                        </br>
                        Max Score: ${assignmentInstance?.maxScore}
                        </br>
                        Due Date: <g:formatDate date="${assignmentInstance?.deadLineDate}" type="date" style="short"/>
                    </div>
                </div>
                <g:if test="${documentList}">
                    <g:form url="[resource:assignmentInstance, action:'saveGrade']" method="post">
                        <g:hiddenField name="courseId" value="${courseId}" />
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Attachements
                            </div>
                            <div class="panel-body">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th> Student Name </th>
                                            <th> File Name</th>
                                            <th> Score </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:each in="${documentList}" status="i" var="documentInstance">
                                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <td>${documentInstance.creator}</td>
                                                <td><g:link controller="document" action="download" id="${documentInstance.id}">${documentInstance?.filename}</g:link></td>
                                                <td><input type="number" name="grade_${documentInstance.creator.id}" max="${assignmentInstance?.maxScore}"></td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    <g:submitButton class="btn btn-primary" name="saveGrade" value="Save" />
                    </g:form>
                </g:if>
                
                <!-- <g:link action="submitAssignment" params="${[id: assignmentInstance?.id]}">
                    <g:link action="saveGrade" resource="${assignmentInstance}">
                        <button class="btn btn-primary">Save</button>
                    </g:link>
                </g:link> -->

                <!-- <g:if test="${role.contains('ROLE_ADMIN')}">
                    <g:form url="[resource:assignmentInstance, action:'delete']" method="DELETE">
                        <fieldset class="buttons">
                            <g:link class="edit" action="edit" resource="${assignmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                            <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                        </fieldset>
                    </g:form>
                </g:if> -->
            </div>
        </div>
    </body>
</html>
