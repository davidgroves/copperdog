<?php

if(!defined('LYCHEE')) exit('Error: Direct access is not allowed!');

# Database configuration
$dbHost = 'localhost'; # Host of the database
$dbUser = '{{ secrets_mysql_lychee_username }}'; # Username of the database
$dbPassword = '{{ secrets_mysql_lychee_password }}'; # Password of the database
$dbName = 'lychee'; # Database name
$dbTablePrefix = ''; # Table prefix

?>