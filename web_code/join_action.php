<?php
//error_reporting(E_ALL);  ini_set("display_errors", 1);

include './dbconn.php';

$id=$_POST['u_id'];
$pwd=$_POST['u_pwd'];
$name=$_POST['u_name'];
$age=$_POST['u_age'];
$sex=$_POST['u_sex'];

$wp=$_POST['point'];
$genre=$_POST['prefer'];

$query="SELECT * from user where 회원아이디='$id'";
$result = mysqli_query($connect, $query);
$num = mysqli_num_rows($result);


if ($num)
{
    echo "<script>alert('해당 아이디는 이미 존재하는 아이디입니다!');history.go(-1)</script>";
}
else
{
    $query1="INSERT into user(회원아이디, 비밀번호, 이름, 나이, 성별) values('$id', '$pwd', '$name', '$age', '$sex')";
    $query2="INSERT into watchingpoint(회원아이디, 관람포인트1, 관람포인트2, 관람포인트3) values('$id', '$wp[0]', '$wp[1]', '$wp[2]')";
    $query3="INSERT into usergenre(회원아이디, 장르1, 장르2, 장르3) values('$id', '$genre[0]', '$genre[1]', '$genre[2]')";
    mysqli_query($connect, $query1);
    mysqli_query($connect, $query2);
    mysqli_query($connect, $query3);
    echo "<script>alert('회원가입이 완료되었습니다!'); location.href='./index.html';</script>";
}

?>