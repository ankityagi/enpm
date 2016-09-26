
<%@ page import="elms.Announcement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'announcement.label', default: 'Announcement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-announcement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-announcement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="announcement.creator.label" default="Creator" /></th>
					
						<th><g:message code="announcement.instructor.label" default="Instructor" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'announcement.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'announcement.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'announcement.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${announcementInstanceList}" status="i" var="announcementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${announcementInstance.id}">${fieldValue(bean: announcementInstance, field: "creator")}</g:link></td>
					
						<td>${fieldValue(bean: announcementInstance, field: "instructor")}</td>
					
						<td>${fieldValue(bean: announcementInstance, field: "description")}</td>
					
						<td><g:formatDate date="${announcementInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${announcementInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${announcementInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
