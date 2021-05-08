<html>

 <head>

   <title>CS 364 PEX2 Demo.php</title>
   <style>
     body {font-family: Arial; color: black; }
     h1 {background-color: blue; color: white; }
   </style>

<?php
$connect = mysql_connect("localhost", "student", "CompSci364");
if(!connect){die('Connection Failed: '.mysql_error());}
mysql_select_db("student", $connect);

$user_info = "INSERT INTO user(username,password) VALUES('$POST[username]', '$_POST[password]')"; 
if (!mysql_query($user_info, $connect)){
die('Error: '.mysql_error());}
echo "your information was added to the database.";
mysql_close($connect); ?>


 </head>

 <body>
   <center>
    
   </center>
 </body>
</html>
