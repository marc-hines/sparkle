<?php

  $dbInfo['database_target'] = "localhost";
  $dbInfo['database_name'] = "sparkle_app";
  $dbInfo['username'] = "root";
  $dbInfo['password'] = "cookiemonster";

  try {
    $dbConnString = "mysql:host=" . $dbInfo['database_target'] . "; dbname=" . $dbInfo['database_name'];
    $db = new PDO($dbConnString, $dbInfo['username'], $dbInfo['password']);
    // debugging mode
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    // live on client mode
    //$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_SILENT);

  } catch (PDOException $e) {
      echo 'Connection failed: ' . $e->getMessage();
  }
