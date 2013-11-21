<?php
    session_start();

    // base framework
    require(dirname(__FILE__).'/lib/session_db.php');
    require(dirname(__FILE__).'/lib/application_controller.php');
    require(dirname(__FILE__).'/lib/model.php');
    require(dirname(__FILE__).'/lib/request.php');
    require(dirname(__FILE__).'/lib/response.php');

    // require /models
    require(dirname(__FILE__).'/app/models/user.php');
    require(dirname(__FILE__).'/app/models/jobcode.php');
    require(dirname(__FILE__).'/app/models/job.php');
    require(dirname(__FILE__).'/app/models/jobgrid.php');
    require(dirname(__FILE__).'/app/models/message.php');
    require(dirname(__FILE__).'/app/models/customer.php');
    require(dirname(__FILE__).'/app/models/customergrid.php');
    require(dirname(__FILE__).'/app/models/invoice.php');
    require(dirname(__FILE__).'/app/models/receivable.php');
    require(dirname(__FILE__).'/app/models/collection.php');
    require(dirname(__FILE__).'/app/models/collectionsummary.php');
    require(dirname(__FILE__).'/app/models/invoicebehavior.php');
    require(dirname(__FILE__).'/app/models/invoicefrequency.php');
    require(dirname(__FILE__).'/app/models/jobfrequency.php');
