<%@ page import="elms.Message" %>



<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="message.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${messageInstance?.creator?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'from', 'error')} required">
	<label for="from">
		<g:message code="message.from.label" default="From" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="from" name="from.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${messageInstance?.from?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'to', 'error')} required">
	<label for="to">
		<g:message code="message.to.label" default="To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="to" name="to.id" from="${elms.auth.SecUser.list()}" optionKey="id" required="" value="${messageInstance?.to?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'body', 'error')} ">
	<label for="body">
		<g:message code="message.body.label" default="Body" />
		
	</label>
	<g:textField name="body" value="${messageInstance?.body}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: messageInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="message.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${messageInstance?.subject}"/>

</div>

