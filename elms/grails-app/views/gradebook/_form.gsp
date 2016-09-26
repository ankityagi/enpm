<%@ page import="elms.Gradebook" %>



<div class="fieldcontain ${hasErrors(bean: gradebookInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="gradebook.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${gradebookInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradebookInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="gradebook.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${gradebookInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradebookInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="gradebook.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${gradebookInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradebookInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="gradebook.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${gradebookInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: gradebookInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="gradebook.students.label" default="Students" />
		
	</label>
	<g:select name="students" from="${elms.auth.SecUser.list()}" multiple="multiple" optionKey="id" size="5" value="${gradebookInstance?.students*.id}" class="many-to-many"/>

</div>

