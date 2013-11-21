<?php
    require('rest/init.php');

    // Get Request
    $request = new Request(array('restful' => true));

    // Get Controller
    $controller_name = strtolower($request->controller);

    require('rest/app/controllers/' . $controller_name . '.php');

	$controller_name = ucfirst($controller_name);
	$controller = new $controller_name;
	// Dispatch request
	echo $controller->dispatch($request);


