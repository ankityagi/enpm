<!-- Side Bar Template-->
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title toggle">
			<a data-toggle="collapse" data-target="#collapseWorkspace" href="#">
				<i class="fa fa-gear"></i> Actions
			</a>
		</h3>
	</div>
	<div class="panel-body collapse in" id="collapseWorkspace">
		<div class="list-group">
			<g:link controller="home" action="index"  params="[sort:'dateCreated', order:'desc']" class="list-group-item"><i class="fa fa-dashboard"></i> Home</g:link>
			<g:link controller="patient" action="index"  params="[sort:'dateCreated', order:'desc']" title="List All Patients" class="list-group-item"><i class="fa fa-users"></i> All Patients</g:link>
			<g:link controller="patient" action="create" title="Add Patient" class="list-group-item"><i class="fa fa-user-plus"></i> Add New Patient</g:link>
			<p>&nbsp;</p>
			<div class="list-group-item list-group-item-danger">Options</div>
			<g:link controller="pharmacy" action="create" class="list-group-item"><i class="fa fa-university"></i> Add New Pharmacy</g:link>
			<g:link controller="doctor" action="create" class="list-group-item"><i class="fa fa-user-md"></i> Add New Doctor</g:link>
			<g:link controller="medication" action="create" class="list-group-item"><i class="fa fa-medkit"></i> Add New Medication</g:link>
		</div>
	</div>
</div>

<!-- Custom Menu -->
