<?php
/* Change for your username and password */
define('DB_SERVER', 'classmysql.engr.oregonstate.edu');
define('DB_USERNAME', 'cs340_USERNAME');
define('DB_PASSWORD', 'PASSWORD');
define('DB_NAME', 'cs340_USERNAME');
 
/* Attempt to connect to MySQL database */
$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
 
// Check connection
if($link === false){
    die("ERROR: Could not connect. " . mysqli_connect_error());
}
?>