<%@ page import="elms.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="course.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	${currentUser}ddd
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${courseInstance?.creator?.id}" class="many-to-one form-control"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="course.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${courseInstance?.instructor?.id}" class="many-to-one form-control" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="course.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField class="form-control" name="name" required="" value="${courseInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="course.description.label" default="Description" />
		
	</label>
	<g:textField class="form-control" name="description" value="${courseInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'announcements', 'error')} ">
	<label for="announcements">
		<g:message code="course.announcements.label" default="Announcements" />
		
	</label>
	<g:select name="announcements" from="${elms.Assignment.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.announcements*.id}" class="many-to-many form-control"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'assignments', 'error')} ">
	<label for="assignments">
		<g:message code="course.assignments.label" default="Assignments" />
		
	</label>
	<g:select name="assignments" from="${elms.Assignment.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.assignments*.id}" class="many-to-many form-control"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'modules', 'error')} ">
	<label for="modules">
		<g:message code="course.modules.label" default="Modules" />
		
	</label>
	<g:select name="modules" from="${elms.Module.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.modules*.id}" class="many-to-many form-control"/>

</div>

<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'students', 'error')} ">
	<label for="students">
		<g:message code="course.students.label" default="Students" />
		
	</label>
	<g:select name="students" from="${elms.auth.SecUser.list()}" multiple="multiple" optionKey="id" size="5" value="${courseInstance?.students*.id}" class="many-to-many form-control"/>

</div>

