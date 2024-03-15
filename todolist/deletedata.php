<?php
include("config.php");
$title = $_POST['title'];
$desc = $_POST['desc'];
$id = $_POST['Id'];
if ($title != "" && $desc != "") {
 $sql = "DELETE FROM content WHERE Id = $id;
 ";
 if (mysqli_query($conn, $sql)) {
  echo "true";
 } else {
  echo "false";
 }
}
