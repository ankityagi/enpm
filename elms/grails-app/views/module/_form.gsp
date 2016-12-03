<%@ page import="elms.Module" %>

<g:set var="creator.id" value="${currentUser?.id}" />
<g:set var="instructor.id" value="${currentUser?.id}" />


<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="announcement.description.label" default="Name" />
	</label>
	<div class="form-group">
		<textarea type="text" class="form-control" rows="1" name="name" value="${announcementInstance?.name}"></textarea>
	</div>
</div>

