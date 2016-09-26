<%@ page import="elms.auth.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="username" maxlength="128" required="" value="${secUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUserInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="secUser.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${secUserInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'timezone', 'error')} ">
	<label for="timezone">
		<g:message code="secUser.timezone.label" default="Timezone" />
		
	</label>
	<g:textField name="timezone" value="${secUserInstance?.timezone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'firstName', 'error')} ">
	<label for="firstName">
		<g:message code="secUser.firstName.label" default="First Name" />
		
	</label>
	<g:textField name="firstName" value="${secUserInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'lastName', 'error')} ">
	<label for="lastName">
		<g:message code="secUser.lastName.label" default="Last Name" />
		
	</label>
	<g:textField name="lastName" value="${secUserInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />

</div>

