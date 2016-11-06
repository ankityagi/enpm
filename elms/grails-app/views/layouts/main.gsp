<!DOCTYPE html>
<html lang="en">

<head>
    <!-- ICONS -->
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
    <!-- ================== BEGIN BASE CSS STYLE ================== -->
    <link href="${resource(dir: 'plugins/bootstrap/css', file: 'bootstrap.min.css')}" rel="stylesheet" />
    <link href="${resource(dir: 'plugins/font-awesome/css', file: 'font-awesome.min.css')}" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="${resource(dir: 'plugins/metisMenu', file: 'metisMenu.min.css')}" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="${resource(dir: 'dist/css', file: 'sb-admin-2.css')}" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${resource(dir: 'plugins/font-awesome/css', file: 'font-awesome.min.css')}" rel="stylesheet" type="text/css">
    <link href="${resource(dir: 'plugins/datatables-responsive', file: 'dataTables.responsive.css')}" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${resource(dir: 'plugins/font-awesome/css', file: 'font-awesome.min.css')}" rel="stylesheet" type="text/css">
    <!-- DataTables CSS -->
    <link href="${resource(dir: 'plugins/datatables-plugins', file: 'dataTables.bootstrap.css')}" rel="stylesheet">
    <g:layoutHead/>
    <r:layoutResources disposition="head" />
</head>

<body>
    <!-- Body HTML -->
    <!-- Desktop Nav Bar -->
    <!-- /Mobile Nav Bar -->
    <g:layoutBody/>
    <script src="${resource(dir: 'plugins/jquery', file: 'jquery-3.1.1.min.js')}"></script>
    <script src="${resource(dir: 'plugins/bootstrap/js', file: 'bootstrap.min.js')}"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${resource(dir: 'plugins/metisMenu', file: 'metisMenu.min.js')}"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${resource(dir: 'dist/js', file: 'sb-admin-2.js')}"></script>
    <!-- DataTables JavaScript -->
    <script src="${resource(dir: 'plugins/datatables/js', file: 'jquery.dataTables.min.js')}"></script>
    <script src="${resource(dir: 'plugins/datatables-plugins', file: 'dataTables.bootstrap.min.js')}"></script>
    <script src="${resource(dir: 'plugins/datatables-responsive', file: 'dataTables.responsive.js')}"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${resource(dir: 'dist/js', file: 'sb-admin-2.js')}"></script>
    <r:layoutResources disposition="defer" />
    <!-- JavaScript Code -->
</body>

</html>
