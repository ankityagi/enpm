<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'assignment.label', default: 'Assignment')}" />
    <title>
        <g:message code="default.create.label" args="[entityName]" />
    </title>
    <link href="${resource(dir: 'plugins/jquery-file-upload/blueimp-gallery', file: 'blueimp-gallery.min.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'plugins/jquery-file-upload/css', file: 'jquery.fileupload.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'plugins/jquery-file-upload/css', file: 'jquery.fileupload-ui.css')}" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
	<link href="${resource(dir: 'plugins/bootstrap-fileinput/css', file: 'fileinput.min.css')}" rel="stylesheet" type="text/css" />

	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- optionally if you need a theme like font awesome theme you can include 
	    it as mentioned below -->
</head>

<body>
    <div class="container">
        <div id="create-assignment" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <div class="row">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${assignmentInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${assignmentInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                                <g:message error="${error}" />
                            </li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form url="[resource:assignmentInstance, action:'save']" method="post" enctype="multipart/form-data">
                <g:hiddenField name="courseId" value="${courseInstance?.id}" />
                <g:hiddenField name="object" value="assignment" />
                    <fieldset class="form">
                        <g:render template="form" />
                    </fieldset>
                    </br>
                    <label class="control-label">Select File</label>
					<input id="input-1" type="file" name="files[]" multiple>
					<g:submitButton name="save" value="Create" />
				</g:form>
					
					
<!-- begin scroll to top btn -->
</body>

<!-- ================== BEGIN PAGE LEVEL JS ================== -->

<!-- ================== END PAGE LEVEL JS ================== -->

    </script>

</html>
