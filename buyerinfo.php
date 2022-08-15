<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BUYER's Data</title>
</head>
<body>
<?php
include_once "connection.php";
echo "<h3>Here is the details of the BUYER you have asked about.</h3>";
$name = $_POST['name'];
$sql = "SELECT member.name, member.address, member.phone_num, member.email, buyer.shipping_address, items.title, items.description, category.c_name, _transaction.tid, _transaction.amount, _transaction._time, feedback.rating, feedback._comment FROM auction.member, auction.buyer, auction.items, auction.category, auction._transaction, auction.feedback WHERE member.mid = buyer.mid AND member.mid = items.buyer_mid AND category.cat_id = items.cat_id AND items.item_id = _transaction.item_id AND _transaction.tid = feedback.tid AND name = '$name';";
$result = mysqli_query($connection, $sql);
// $numrows = mysqli_num_rows($result);

echo "<table border='1' class='center' cellspacing='0'>
<tr>
    <th>Name</th>
    <th>Address</th>
    <th>Phone No.</th>
    <th>Email ID</th>
    <th>Shipping Address</th>
    <th>Item BOUGHT</th>
    <th>Product Description</th>
    <th>Product Category</th>
    <th>Transaction ID</th>
    <th>Amount</th>
    <th>Date & Time</th>
    <th>Product Rating</th>
    <th>Product Feedback</th>
</tr>";

while($row = mysqli_fetch_assoc($result)){
    echo "<tr>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['address'] . "</td>";
        echo "<td>" . $row['phone_num'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['shipping_address'] . "</td>";
        echo "<td>" . $row['title'] . "</td>";
        echo "<td>" . $row['description'] . "</td>";
        echo "<td>" . $row['c_name'] . "</td>";
        echo "<td>" . $row['tid'] . "</td>";
        echo "<td>" . $row['amount'] . "</td>";
        echo "<td>" . $row['_time'] . "</td>";
        echo "<td>" . $row['rating'] . "</td>";
        echo "<td>" . $row['_comment'] . "</td>";
    echo "</tr>";
}
echo "</table>";
?>
</body>

</html>