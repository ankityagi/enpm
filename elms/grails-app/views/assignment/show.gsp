
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
				<h1><strong>${assignmentInstance?.name}</strong></h1>
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
					<div class="panel panel-primary">
						<div class="panel-heading">
							Attachements
						</div>
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                            <thead>
	                                    <tr>
	                                    
	                                        <th>File Name</th>
	                                    
	                                        <g:sortableColumn property="dateCreated" title="${message(code: 'course.dateCreated.label', default: 'Date Created')}" />
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                <g:each in="${documentList}" status="i" var="documentInstance">
	                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
	                                    
	                                        <td><g:link controller="document" action="download" id="${documentInstance.id}">${documentInstance?.filename}</g:link></td>
	                                    
	                                        <td><g:formatDate date="${assignmentInstance.dateCreated}" type="date" style="short"/></td>
	                                    
	                                    </tr>
	                                </g:each>
	                                </tbody>
	                            </table>
						</div>
					</div>
				</g:if>
				
				<g:if test="${role.contains('ROLE_ADMIN') || role.contains('ROLE_INSTRUCTOR') }">
					<g:link controller="assignment" action="grade" id="${assignmentInstance.id}" params="${[courseId: courseId]}"><button class="btn btn-primary">Grade</button></g:link>
				</g:if>
				<g:else>
					<!-- <g:link controller="assignment" action="submitAssignment" id="${assignmentInstance.id}"><button class="btn btn-primary">Submit Assignment</button></g:link> -->
					<button id="sumit-assignment" class="btn btn-primary">Submit Assignment</button>

				</g:else>

				<div id="submit-assignment-div" style="display: none;">
					<g:form url="[resource:assignmentInstance, action:'submitAssignment']" method="post" enctype="multipart/form-data">
	                <g:hiddenField name="courseId" value="$courseId" />
	                <g:hiddenField name="object" value="assignmentSubmission" />
	                    <label class="control-label">Select File to submit</label>
						<input id="input-1" type="file" name="files[]" multiple>
						</br>
						<g:submitButton name="submitAssignment" value="Submit" />
						</br>
					</g:form>
				</div>

				<g:if test="${role.contains('ROLE_ADMIN')}">
					<g:form url="[resource:assignmentInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${assignmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</g:if>
			</div>
		</div>
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
