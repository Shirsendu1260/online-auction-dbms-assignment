<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SELLER's Data</title>
</head>
<body>
    <?php
include_once "connection.php";
echo "<h3>Here is the details of the SELLER you have asked about.</h3>";
$name = $_POST['name'];
$sql = "SELECT member.name, member.address, member.phone_num, member.email, seller.bank_account_num, seller.routing_num, items.title, items.description, category.c_name, _transaction.tid, _transaction.amount, _transaction._time, feedback.rating, feedback._comment FROM auction.member, auction.seller, auction.items, auction.category, auction._transaction, auction.feedback WHERE member.mid = seller.mid AND member.mid = items.seller_mid AND category.cat_id = items.cat_id AND items.item_id = _transaction.item_id AND _transaction.tid = feedback.tid AND name = '$name';";
$result = mysqli_query($connection, $sql);
// $numrows = mysqli_num_rows($result);

echo "<table border='1' class='center' cellspacing='0'>
<tr>
    <th>Name</th>
    <th>Address</th>
    <th>Phone No.</th>
    <th>Email ID</th>
    <th>Bank Account No.</th>
    <th>Routing No.</th>
    <th>Item SOLD</th>
    <th>Product Description</th>
    <th>Product Category</th>
    <th>Transaction ID</th>
    <th>Amount</th>
    <th>Date & Time</th>
    <th>Product Rating (Given by BUYER)</th>
    <th>Product Feedback (Given by BUYER)</th>
</tr>";

while($row = mysqli_fetch_assoc($result)){
    echo "<tr>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['address'] . "</td>";
        echo "<td>" . $row['phone_num'] . "</td>";
        echo "<td>" . $row['email'] . "</td>";
        echo "<td>" . $row['bank_account_num'] . "</td>";
        echo "<td>" . $row['routing_num'] . "</td>";
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