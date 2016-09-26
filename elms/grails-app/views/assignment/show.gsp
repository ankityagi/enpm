
<%@ page import="elms.Assignment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-assignment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-assignment" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list assignment">
			
				<g:if test="${assignmentInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="assignment.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="secUser" action="show" id="${assignmentInstance?.creator?.id}">${assignmentInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.instructor}">
				<li class="fieldcontain">
					<span id="instructor-label" class="property-label"><g:message code="assignment.instructor.label" default="Instructor" /></span>
					
						<span class="property-value" aria-labelledby="instructor-label"><g:link controller="secUser" action="show" id="${assignmentInstance?.instructor?.id}">${assignmentInstance?.instructor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="assignment.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${assignmentInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="assignment.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${assignmentInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="assignment.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${assignmentInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.deadLineDate}">
				<li class="fieldcontain">
					<span id="deadLineDate-label" class="property-label"><g:message code="assignment.deadLineDate.label" default="Dead Line Date" /></span>
					
						<span class="property-value" aria-labelledby="deadLineDate-label"><g:formatDate date="${assignmentInstance?.deadLineDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.grades}">
				<li class="fieldcontain">
					<span id="grades-label" class="property-label"><g:message code="assignment.grades.label" default="Grades" /></span>
					
						<g:each in="${assignmentInstance.grades}" var="g">
						<span class="property-value" aria-labelledby="grades-label"><g:link controller="gradebook" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.isPublished}">
				<li class="fieldcontain">
					<span id="isPublished-label" class="property-label"><g:message code="assignment.isPublished.label" default="Is Published" /></span>
					
						<span class="property-value" aria-labelledby="isPublished-label"><g:formatBoolean boolean="${assignmentInstance?.isPublished}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="assignment.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${assignmentInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${assignmentInstance?.maxScore}">
				<li class="fieldcontain">
					<span id="maxScore-label" class="property-label"><g:message code="assignment.maxScore.label" default="Max Score" /></span>
					
						<span class="property-value" aria-labelledby="maxScore-label"><g:fieldValue bean="${assignmentInstance}" field="maxScore"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:assignmentInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${assignmentInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
