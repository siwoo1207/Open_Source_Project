<?php

include './dbconn.php';

$id=$_POST['id'];
$pwd=$_POST['pw'];

$query="SELECT * from user where 회원아이디='$id'";
//echo $query;

$result = mysqli_query($connect, $query);
$num = mysqli_num_rows($result);
$row = mysqli_fetch_array($result);


if ($num) {
    if ($row['pw'] == $pwd) {
        if($row['id']=='관리자'){//관리자이면 관리자모드로 로그인 할 수 있게 함
            echo "<form name='logged' action='./recomm.php' method='post'><input type='hidden' name='login_success' value='1'>";
            echo "<input type='hidden' name='login_id' value='$id'></form>";
            echo "<script>alert('관리자 모드로 로그인에 성공하셨습니다.'); document.logged.submit();</script>";
        }
        else{//아이디가 관리자가 아니면 그냥 회원용으로 로그인
            echo "<form name='logged' action='./recomm.php' method='post'><input type='hidden' name='login_success' value='1'>";
            echo "<input type='hidden' name='login_id' value='$id'></form>";
            echo "<script>alert('로그인에 성공하셨습니다. 환영합니다!'); document.logged.submit();</script>";
        }
    }
    else
    {//비밀번호가 틀리면 비번오류 출력하고 전 페이지로 돌아감
        echo "<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>";
    }
}
else
{//아이디가 존재하지 않으면 메인창으로 넘어감
    echo "<script>alert('해당 아이디가 존재하지 않습니다. 회원가입 후 이용해주시기 바랍니다.'); history.go(-1);</script>";
}

?>