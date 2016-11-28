
<%@ page import="elms.Announcement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'announcement.label', default: 'Announcement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="container">
			<div class="row">
                <g:render template="/shared/topbar" />
            </div>
			<div id="show-announcement" class="content scaffold-show" role="main">
				<h1><strong>${announcementInstance?.name}</strong></h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
				<div class="panel panel-primary">
					<div class="panel-heading">
						Date Created: <g:formatDate date="${announcementInstance?.dateCreated}" type="date" style="short"/>  |  By: ${announcementInstance?.creator}
					</div>
					<div class="panel-body">
						${announcementInstance?.description}
					</div>
				</div>

				
				<g:if test="${role.contains('ADMIN')}">
					<g:form url="[resource:announcementInstance, action:'delete']" method="DELETE">
						<fieldset class="buttons">
							<g:link class="edit" action="edit" resource="${announcementInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
							<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</g:if>
			</div>
		</div>
	</body>
</html>
