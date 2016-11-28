<%@ page import="elms.Assignment" %>



<!-- div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="assignment.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${assignmentInstance?.creator?.id}" class="many-to-one"/>

</div> -->
<g:set var="creator.id" value="${currentUser?.id}" />
<g:set var="instructor.id" value="${currentUser?.id}" />

<!-- <div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'instructor', 'error')} ">
	<label for="instructor">
		<g:message code="assignment.instructor.label" default="Instructor" />
		
	</label>
	<g:select id="instructor" name="instructor.id" from="${elms.auth.SecUser.list()}" optionKey="id" value="${assignmentInstance?.instructor?.id}" class="many-to-one" noSelection="['null': '']"/>

</div> -->

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'name', 'error')} required">
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


<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'deadLineDate', 'error')} required">
	<label for="deadLineDate">
		<g:message code="assignment.deadLineDate.label" default="Dead Line Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="deadLineDate" precision="day"  value="${assignmentInstance?.deadLineDate}"  />

</div>

<!-- <div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'grades', 'error')} ">
	<label for="grades">
		<g:message code="assignment.grades.label" default="Grades" />
		
	</label>
	<g:select name="grades" from="${elms.Gradebook.list()}" multiple="multiple" optionKey="id" size="5" value="${assignmentInstance?.grades*.id}" class="many-to-many"/>

</div> -->

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'isPublished', 'error')} ">
	<label for="isPublished">
		<g:message code="assignment.isPublished.label" default="Is Published" />
		
	</label>
	<g:checkBox name="isPublished" value="${assignmentInstance?.isPublished}" />

</div>

<div class="fieldcontain ${hasErrors(bean: assignmentInstance, field: 'maxScore', 'error')} required">
	<label for="maxScore">
		<g:message code="assignment.maxScore.label" default="Max Score" />
		<span class="required-indicator">*</span>
	</label>
	<input name="maxScore" type="number" name="quantity" min="1" max="100" required="">
	<!-- <g:field name="maxScore" value="${fieldValue(bean: assignmentInstance, field: 'maxScore')}" required=""/> -->
</div>

