
<%@ page import="elms.Assignment" %>
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
                <h1><strong>Class Roster for ${courseInstance?.name}</strong></h1>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <!-- <div class="panel panel-primary">
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
                </div> -->
                <g:if test="${studentRosterMap}">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Roster and Grades for ${courseInstance?.name}
                        </div>
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                        <tr>
                                            <th>Student</th>
                                            <th>Assignments Submitted (out of ${assignmentsList.size()})</th>
                                            <th>Grade</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${studentRosterMap}" status="i" var="item">
                                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                            <td>${item.key}</td>
                                            <td>${item.value[0]}</td>
                                            <td>${item.value[0]}%</td>
                                            
                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <h3>No Grades Yet!</h3>
                </g:else>
                
                
        <script src="${resource(dir: 'plugins/jquery', file: 'jquery.min.js')}"></script>

        <script language="JavaScript" type="text/javascript">
        $(document).ready(function() {
            $("#sumit-assignment").click(function(){
                console.log("FFF");
                $("#submit-assignment-div").show();
            });
        });
        </script>
    </body>
</html>
