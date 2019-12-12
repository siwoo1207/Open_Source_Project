<?php

include './dbconn.php';

$sat = $_POST['satisfaction'];
$comm = $_POST['comments'];
$comm = nl2br($comm);

$query="insert into feedback(만족도, 코멘트) values ('$sat', '$comm')";

mysqli_query($connect, $query);

echo "<script>alert('게시글이 작성되었습니다.');</script>";
echo "<script>alert('thank you');location.href='./recomm.php';</script>";

?>