<?php
include("config.php");
$title = $_POST['title'];
$desc = $_POST['desc'];
if ($title != "" && $desc != "") {
 $sql = "INSERT INTO `content` (title, `desc`) VALUES ( '$title', '$desc');";
 if (mysqli_query($conn, $sql)) {
  echo "true";
 } else {
  echo "false";
 }
}
