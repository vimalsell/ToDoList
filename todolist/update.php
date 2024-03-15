<?php
include("config.php");
$title = $_POST['title'];
$desc = $_POST['desc'];
$id = $_POST['Id'];
if ($title != "" && $desc != "") {
 $sql = "UPDATE content SET title='$title', `desc`='$desc' WHERE Id = $id;
 ";
 if (mysqli_query($conn, $sql)) {
  echo "true";
 } else {
  echo "false";
 }
}
