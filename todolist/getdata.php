<?php
include("config.php");
$sql = "SELECT *  FROM content";
$result = array();
$res = mysqli_query($conn, $sql);
if ($res->num_rows > 0) {
 while ($row = $res->fetch_assoc()) {
  $result[] = $row;
 }
 echo json_encode($result);
}
