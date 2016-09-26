<%@ page import="elms.Announcement" %>



<div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="announcement.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${announcementInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="announcement.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${announcementInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="announcement.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${announcementInstance?.description}"/>

</div>

