<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "auction";

$connection = mysqli_connect($servername, $username, $password, $database);

if(!$connection){
    echo "Database connection failed due to this error : " . mysqli_connect_error($connection);
}
?>