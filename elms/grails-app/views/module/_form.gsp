<%@ page import="elms.Module" %>



<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="module.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${moduleInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="module.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${moduleInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="module.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${moduleInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: moduleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="module.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${moduleInstance?.name}"/>

</div>

