
<%@ page import="elms.Assignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-assignment" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="assignment.creator.label" default="Creator" /></th>
					
						<th><g:message code="assignment.instructor.label" default="Instructor" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'assignment.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'assignment.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'assignment.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="deadLineDate" title="${message(code: 'assignment.deadLineDate.label', default: 'Dead Line Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${assignmentInstanceList}" status="i" var="assignmentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${assignmentInstance.id}">${fieldValue(bean: assignmentInstance, field: "creator")}</g:link></td>
					
						<td>${fieldValue(bean: assignmentInstance, field: "instructor")}</td>
					
						<td>${fieldValue(bean: assignmentInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: assignmentInstance, field: "description")}</td>
					
						<td><g:formatDate date="${assignmentInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${assignmentInstance.deadLineDate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${assignmentInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
