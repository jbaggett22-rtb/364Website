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


$watchquery = "INSERT INTO Watchlist (name, stock_ticker) VALUES (?, ?)";
$watchstatement = $connection->prepare($watchquery);
$watchstatement->bind_param("ss", $watchname, $watchticker);
$watchname = $_POST['watchlistname'];
$watchticker = 'SPY';
$watchstatement->execute();
$watchstatement->close();
$connection->next_result();
echo "New record for watchlist has been inserted\n";


$transquery = "INSERT INTO TransactionRecord (stock_ticker, num_shares, total_purchase_price) VALUES ('SPY', '1', '422')";
$connection->query($transquery);

echo "New record for TransactionRecord has been inserted\n";



$portquery = "INSERT INTO Portfolio (portfolio_name, transaction_record_id) VALUES (?, ?)";
$portstatement = $connection->prepare($portquery);
$portstatement->bind_param("si", $portname, $transid);
$portname = $_POST['portfolioname'];
$data = $connection->prepare("SELECT COUNT(*) FROM TransactionRecord");

$data->execute();
$data->bind_result($transid);
if($data){
    while ($row = $data->fetch()){
        $user_arr[] = $row;
    }

    $data->close();
    $connection->next_result();
}

$portstatement->execute();
$portstatement->close();
$connection->next_result();
echo "New record for Portfolio has been inserted\n";



$userquery = "insert into User(username, portfolio_name, password_hash, Watchlist_id) values (?,?,?,?)";
$userstatement = $connection->prepare($userquery);
$userstatement->bind_param("sssi", $username1, $portname1, $password1, $Watchlist1);
$username1 = $_POST['username'];

$data1 = $connection->prepare("SELECT COUNT(*) FROM Watchlist;");
$data1->execute();
$data1->bind_result($Watchlist1);
if($data1){
    while ($row = $data1->fetch()){
        $user_arr[] = $row;
    }

    $data1->close();
    $connection->next_result();
}

echo $Watchlist1;
$portname1 = $_POST['portfolioname'];
$password1 = $_POST['password'];

$userstatement->execute();
$userstatement->close();
$connection->next_result();

echo "New record for user has been inserted\n";




$sql = "SELECT * FROM User";
$result = $connection->query($sql);
if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
    echo "id: " . $row["user_id"];
  }
} else {
  echo "0 results";
}

$connection->close();
 ?>

 </body>
</html>
