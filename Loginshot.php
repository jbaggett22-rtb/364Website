<html>

 <head>

   <title>CS 364 Create_Account.php</title>
   <style>
   </style>
</head>


<body>
<?php
$connection = new mysqli("localhost", "student", "CompSci364", "student");
	if($connection -> connect_error){
    		die("ERROR: Could not connect. " . $connection -> connect_error);
	}

$query = "SELECT user_id FROM User WHERE username = ? AND password_hash = ?";
$statement = $connection->prepare($query);
$statement->bind_param("ss", $_POST['username'], $_POST['password']);
echo $_POST['username'];
$statement->execute();
$statement->bind_result($id);
if ($statement->fetch()) {
 header("Location: homepage.html");
}else{
header("Location: login.html");
}

/*
$watchquery = "SELECT * FROM User WHERE username = ? AND password_hash = ?";
$watchstatement = $connection->prepare($watchquery);
$watchstatement->bind_param("ss", $password, $username);

$password = $_POST['password'];
echo $password;
$username = $_POST['username'];
echo $username;

$result = $watchstatement->execute();
echo $result;
$watchstatement->close();
$connection->next_result();
if (mysqli_num_rows($result) > 0) {
  #header("Location: homepage.html");
 
} else {
  #header("Location: login.html");
}
*/

$connection->close();
 ?>

 </body>
</html>
