<!DOCTYPE html>
<html>
<head>
    <title>FEEDBACK</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
    
<body>
    <br>
    <h1>RECOMMENDATION</h1><br>
    <div class="recomm-box">
        <fieldset>
            <legend><h2>추천 영화 TOP 10</h2></legend>
        
            <?
            include './dbconn.php';

            $query="select * from recommendation order by 평점";

            $result = mysqli_query($connect, $query);
            $num = mysqli_num_rows($result);

            $i = 1;

            while ($row = mysqli_fetch_array($result))
            {
                echo $i++;
                echo '.  ';
                echo $row['영화명'];
                echo ' | ';
                echo $row['평점'];
                echo '<br><br>';
            }
            ?>
        
        </fieldset>
        
        <form action="feedback.html" name='login' method='post'>
            <br><br><input type="submit" value="피드백" style="margin: 0px 100px; border-radius: 10px; width: 100px; height: 30px; cursor: pointer"/><br><br>
        </form>
        <a href="index.html" title="logout" style="cursor: pointer;">로그아웃</a>
    </div>
</body>
</html>

<style>
    @font-face
    {
        font-family: bmjua; 
        src:url(BMJUA_ttf.ttf);
    }
    body
    {
        background-color: gainsboro;
        font-family: bmjua;
    }
    
    h1
    {
        text-align: center;
    }
    
    legend
    {
        text-align: center;
    }
    
    strong
    {
        margin: 0px 20px;
    }
    
    div
    {
        background-color: gray;
        margin: 35px 560px;
        border-radius: 20px;
        padding: 45px 40px 40px;
        width: 310px;
        height: 620px;
        box-shadow: 0px 3px 20px rgba(0,0,0,0.2);
    }
</style>