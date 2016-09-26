
<%@ page import="elms.Course" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'course.label', default: 'Course')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-course" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-course" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list course">
			
				<g:if test="${courseInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="course.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="secUser" action="show" id="${courseInstance?.creator?.id}">${courseInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.instructor}">
				<li class="fieldcontain">
					<span id="instructor-label" class="property-label"><g:message code="course.instructor.label" default="Instructor" /></span>
					
						<span class="property-value" aria-labelledby="instructor-label"><g:link controller="secUser" action="show" id="${courseInstance?.instructor?.id}">${courseInstance?.instructor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="course.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${courseInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="course.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${courseInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.announcements}">
				<li class="fieldcontain">
					<span id="announcements-label" class="property-label"><g:message code="course.announcements.label" default="Announcements" /></span>
					
						<g:each in="${courseInstance.announcements}" var="a">
						<span class="property-value" aria-labelledby="announcements-label"><g:link controller="announcement" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.assignments}">
				<li class="fieldcontain">
					<span id="assignments-label" class="property-label"><g:message code="course.assignments.label" default="Assignments" /></span>
					
						<g:each in="${courseInstance.assignments}" var="a">
						<span class="property-value" aria-labelledby="assignments-label"><g:link controller="assignment" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="course.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${courseInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="course.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${courseInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.modules}">
				<li class="fieldcontain">
					<span id="modules-label" class="property-label"><g:message code="course.modules.label" default="Modules" /></span>
					
						<g:each in="${courseInstance.modules}" var="m">
						<span class="property-value" aria-labelledby="modules-label"><g:link controller="module" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${courseInstance?.students}">
				<li class="fieldcontain">
					<span id="students-label" class="property-label"><g:message code="course.students.label" default="Students" /></span>
					
						<g:each in="${courseInstance.students}" var="s">
						<span class="property-value" aria-labelledby="students-label"><g:link controller="secUser" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:courseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${courseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
