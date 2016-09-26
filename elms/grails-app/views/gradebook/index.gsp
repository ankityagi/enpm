
<%@ page import="elms.Gradebook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradebook.label', default: 'Gradebook')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-gradebook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-gradebook" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="gradebook.creator.label" default="Creator" /></th>
					
						<th><g:message code="gradebook.instructor.label" default="Instructor" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'gradebook.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'gradebook.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'gradebook.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'gradebook.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${gradebookInstanceList}" status="i" var="gradebookInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${gradebookInstance.id}">${fieldValue(bean: gradebookInstance, field: "creator")}</g:link></td>
					
						<td>${fieldValue(bean: gradebookInstance, field: "instructor")}</td>
					
						<td>${fieldValue(bean: gradebookInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: gradebookInstance, field: "description")}</td>
					
						<td><g:formatDate date="${gradebookInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${gradebookInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${gradebookInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
