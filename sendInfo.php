<html>
<body>
<?php
//connection
$dbHost = "localhost";
$dbUser = "student";
$dbPassword = "PASSWORD";
$conn = mysqli($dbHost, $dbUser, $dbPassword);

if($conn->connect_error){
	die("Connection failed: ". $conn-connect_error);
}
echo "connected successfully";

$usr = $_POST['username']);
$pas = $_POST['password']);

$sql = mysql_query("SELECT * FROM User
	WHERE username = '$usr' AND
	password = '$pas'
	LIMIT 1");
if(mysql_num_rows($sql) == 1){
	header("Location: homepage.html");
	exit();
}
else{
	header("Location: login.html");
	exit();
}


?>
</body>
</html>
