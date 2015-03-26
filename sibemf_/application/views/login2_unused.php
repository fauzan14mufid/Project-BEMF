<!DOCTYPE html>
<?php /*
if (isset($_POST['username'])) {
    $root = realpath($_SERVER["DOCUMENT_ROOT"]);
    include "$root\web2\connection\connection.php";
    $query = "SELECT * FROM pelanggan WHERE user_pel='$_POST[username]' and pass_pel='$_POST[password]'";
    $result = mysqli_fetch_array(mysqli_query($link, $query));
    if (!$result) {
        $query = "SELECT * FROM admin WHERE user_admin='$_POST[username]' and pass_admin='$_POST[password]'";
        $result = mysqli_fetch_array(mysqli_query($link, $query));
        if (!$result) {
            header("Location: login2_unused.php?error=true");
        } else {
            setcookie("id", "$result[id_admin]", time() + (3600 * 24));
            setcookie("nama", "$result[user_admin]", time() + (3600 * 24));
            setcookie("tipe", "admin", time() + (3600 * 24));
            header("Location: index.php");
        }
    } else {
        setcookie("id", "$result[id_pel]", time() + (3600 * 24));
        setcookie("nama", "$result[user_pel]", time() + (3600 * 24));
        setcookie("tipe", "pelanggan", time() + (3600 * 24));
        header("Location: index.php");
    }
}*/
?>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log in BelanyaYuk.com</title>
<style>

html, body
{
    height: 100%;
}

body
{
    font: 12px 'Lucida Sans Unicode', 'Trebuchet MS', Arial, Helvetica;    
    margin: 0;
    background-color: #d9dee2;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebeef2), to(#d9dee2));
    background-image: -webkit-linear-gradient(top, #ebeef2, #d9dee2);
    background-image: linear-gradient(top, #ebeef2, #d9dee2);    
}

#login
{
    background-color: #fff;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#eee));
    background-image: -webkit-linear-gradient(top, #fff, #eee);
    background-image: linear-gradient(top, #fff, #eee);  
    height: 240px;
    width: 400px;
    margin: -150px 0 0 -230px;
    padding: 30px;
    position: absolute;
    top: 50%;
    left: 50%;
    z-index: 0;
    -webkit-border-radius: 3px;
    border-radius: 3px;  
    -webkit-box-shadow:
          0 0 2px rgba(0, 0, 0, 0.2),
          0 1px 1px rgba(0, 0, 0, .2),
          0 3px 0 #fff,
          0 4px 0 rgba(0, 0, 0, .2),
          0 6px 0 #fff,  
          0 7px 0 rgba(0, 0, 0, .2);
    box-shadow:
          0 0 2px rgba(0, 0, 0, 0.2),  
          0 1px 1px rgba(0, 0, 0, .2),
          0 3px 0 #fff,
          0 4px 0 rgba(0, 0, 0, .2),
          0 6px 0 #fff,  
          0 7px 0 rgba(0, 0, 0, .2);
}

#login:before
{
    content: '';
    position: absolute;
    z-index: -1;
    border: 1px dashed #ccc;
    top: 5px;
    bottom: 5px;
    left: 5px;
    right: 5px;
    -webkit-box-shadow: 0 0 0 1px #fff;
    box-shadow: 0 0 0 1px #fff;
    background: url('logofix.jpg');
    background-size: 450px 300px;
}

h1
{
    text-shadow: 0 1px 0 rgba(255, 255, 255, .7), 0px 2px 0 rgba(0, 0, 0, .5);
    text-transform: uppercase;
    text-align: center;
    color: white;
    margin: 0 0 30px 0;
    font: normal 26px/1 Verdana, Helvetica;
    position: relative;
}

h1:after, h1:before
{
    background-color: #777;
    height: 1px;
    position: absolute;
    top: 15px;
    width: 120px;   
}

h1:after
{ 
    background-image: -webkit-gradient(linear, left top, right top, from(#777), to(#fff));
    background-image: -webkit-linear-gradient(left, #777, #fff);
    background-image: linear-gradient(left, #777, #fff);      
    right: 0;
}

h1:before
{
    background-image: -webkit-gradient(linear, right top, left top, from(#777), to(#fff));
    background-image: -webkit-linear-gradient(right, #777, #fff);
    background-image: linear-gradient(right, #777, #fff);
    left: 0;
}

fieldset
{
    border: 0;
    padding: 0;
    margin: 0;
}

#inputs input
{
    background: #f1f1f1 no-repeat;
    padding: 15px 15px 15px 30px;
    margin: 0 0 10px 0;
    width: 353px; 
    border: 1px solid #ccc;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    -webkit-box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    box-shadow: 0 1px 1px #ccc inset, 0 1px 0 #fff;
    opacity: 0.4;
}

#username
{
    background-position: 5px -2px !important;
}

#username:hover{
    opacity: 1.0;
}

#password
{
    background-position: 5px -52px !important;
}

#password:hover{
    opacity: 1.0;
}

#inputs input:focus
{
    background-color: #fff;
    border-color: #e8c291;
    outline: none;
    -webkit-box-shadow: 0 0 0 1px #e8c291 inset;
    box-shadow: 0 0 0 1px #e8c291 inset;
}

#actions
{
    margin: 25px 0 0 0;
}

#submit
{		
    background-color: #ffb94b;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#fddb6f), to(#ffb94b));
    background-image: -webkit-linear-gradient(top, #fddb6f, #ffb94b);
    background-image: linear-gradient(top, #fddb6f, #ffb94b);
    -webkit-border-radius: 3px;
    border-radius: 3px;
    
    text-shadow: 0 1px 0 rgba(255,255,255,0.5);
     -webkit-box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;
     box-shadow: 0 0 1px rgba(0, 0, 0, 0.3), 0 1px 0 rgba(255, 255, 255, 0.3) inset;    
    
    border-width: 1px;
    border-style: solid;
    border-color: #d69e31 #e3a037 #d5982d #e3a037;

    float: left;
    height: 35px;
    padding: 0;
    width: 120px;
    cursor: pointer;
    font: bold 15px Arial, Helvetica;
    color: #8f5a0a;
}

#submit:hover,#submit:focus
{		
    background-color: #fddb6f;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ffb94b), to(#fddb6f));
    background-image: -webkit-linear-gradient(top, #ffb94b, #fddb6f);
    background-image: linear-gradient(top, #ffb94b, #fddb6f);
}	

#submit:active
{		
    outline: none;
     -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;
     box-shadow: 0 1px 4px rgba(0, 0, 0, 0.5) inset;		
}

#submit
{
  border: none;
}

#actions a
{
    color: #3151A2;    
    float: right;
    line-height: 35px;
    margin-left: 10px;
}

#back
{
    display: block;
    text-align: center;
    position: relative;
    top: 60px;
    color: #999;
}


</style>
</head>

<body>

<div id="login">
    <form method="post" actions="<?php echo base_url()?>/home/formlogin">
        <?php
        if(isset($_GET['error']))
        {
            echo "Username / Password Salah";
        }
        ?> <br>
    <h1><strong>Log in</strong></h1>
    <fieldset id="inputs">
		<input id="username" type="text" placeholder="Username" autofocus="" required="" name="username">
		<input id="password" type="password" placeholder="Password" required="" name="password">
    </fieldset>
    <fieldset id="actions">
        <input type="submit" id="submit" value="Log in">
        <a href="signup.php">Register</a>
    </fieldset>
    <a href="index.php" id="back">BelanjaYuk</a>
    </form>
</div>

</body>
</html>