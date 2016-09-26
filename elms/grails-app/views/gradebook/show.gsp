
<%@ page import="elms.Gradebook" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'gradebook.label', default: 'Gradebook')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-gradebook" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-gradebook" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list gradebook">
			
				<g:if test="${gradebookInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="gradebook.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="secUser" action="show" id="${gradebookInstance?.creator?.id}">${gradebookInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.instructor}">
				<li class="fieldcontain">
					<span id="instructor-label" class="property-label"><g:message code="gradebook.instructor.label" default="Instructor" /></span>
					
						<span class="property-value" aria-labelledby="instructor-label"><g:link controller="secUser" action="show" id="${gradebookInstance?.instructor?.id}">${gradebookInstance?.instructor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="gradebook.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${gradebookInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="gradebook.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${gradebookInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="gradebook.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${gradebookInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="gradebook.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${gradebookInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${gradebookInstance?.students}">
				<li class="fieldcontain">
					<span id="students-label" class="property-label"><g:message code="gradebook.students.label" default="Students" /></span>
					
						<g:each in="${gradebookInstance.students}" var="s">
						<span class="property-value" aria-labelledby="students-label"><g:link controller="secUser" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:gradebookInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${gradebookInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
