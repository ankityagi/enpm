<%@ page import="elms.Syllabus" %>



<div class="fieldcontain ${hasErrors(bean: syllabusInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="syllabus.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${syllabusInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: syllabusInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="syllabus.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${syllabusInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: syllabusInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="syllabus.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${syllabusInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: syllabusInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="syllabus.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${syllabusInstance?.name}"/>

</div>

