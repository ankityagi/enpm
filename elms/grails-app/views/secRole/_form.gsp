<%@ page import="elms.auth.SecRole" %>



<div class="fieldcontain ${hasErrors(bean: secRoleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="secRole.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" maxlength="128" required="" value="${secRoleInstance?.authority}"/>

</div>

