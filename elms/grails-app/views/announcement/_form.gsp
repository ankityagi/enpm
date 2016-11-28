<%@ page import="elms.Announcement" %>



<!-- div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="announcement.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select disabled id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${announcementInstance?.creator?.id}" class="many-to-one"/>

</div> -->
<g:set var="creator.id" value="${currentUser?.id}" />

<div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="announcement.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${announcementInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: announcementInstance, field: 'description', 'error')} ">

	<label for="name">
		<g:message code="announcement.description.label" default="Name" />
	</label>
	<div class="form-group">
		<textarea type="text" class="form-control" rows="1" name="name" value="${announcementInstance?.name}"></textarea>
	</div>
	<label for="description">
		<g:message code="announcement.description.label" default="Description" />
	</label>
	<div class="form-group">
		<textarea type="text" class="form-control" rows="3" name="description" value="${announcementInstance?.description}"></textarea>
	</div>

</div>

