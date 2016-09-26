
<%@ page import="elms.Syllabus" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'syllabus.label', default: 'Syllabus')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-syllabus" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-syllabus" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="syllabus.creator.label" default="Creator" /></th>
					
						<th><g:message code="syllabus.instructor.label" default="Instructor" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'syllabus.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'syllabus.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'syllabus.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'syllabus.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${syllabusInstanceList}" status="i" var="syllabusInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${syllabusInstance.id}">${fieldValue(bean: syllabusInstance, field: "creator")}</g:link></td>
					
						<td>${fieldValue(bean: syllabusInstance, field: "instructor")}</td>
					
						<td>${fieldValue(bean: syllabusInstance, field: "description")}</td>
					
						<td><g:formatDate date="${syllabusInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${syllabusInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: syllabusInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${syllabusInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
