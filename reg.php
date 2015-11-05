<?php
error_reporting(E_ALL);
ob_start();
ob_implicit_flush(0);
session_name("sid");
session_start();

require("config.php");
$title="Регистрация";
echo '<div class="title">Регистрация</div>';
echo '<div class="b">';


if (isset($_REQUEST['mode'])) {$mode=$_REQUEST['mode'];}

if ($mode=='regok') {
echo "Регистрация успешна!<br/ >";
}

if ($mode=='') {
echo '<form action="?mode=reg" method="post" name="form">';
echo 'Логин:<br/><input name="login" type="text" maxlength="30" /><br/>';
echo 'Пароль:<br/><input name="pass" type="text" maxlength="30" /><br/>';
echo 'Пароль еще раз:<br/><input name="pass1" type="text" maxlength="30" /><br/>';
echo '<input name="submit" type="submit" value="Регистрация" /></form></div>';}


$login = htmlspecialchars(mysql_real_escape_string($_POST['login']));
$pas = md5(htmlspecialchars(mysql_real_escape_string($_POST['pass'])));
$pas1 = md5(htmlspecialchars(mysql_real_escape_string($_POST['pass1'])));


if ($mode=='reg') 
{
	if ($login!=="" AND $pass!=="")
	{
		$res=mysql_query("SELECT * FROM users WHERE login='$login'");
		if (mysql_num_rows($res)>0) 
		{
			echo "Логин недоступен<br/>";
			echo '<a href="reg.php">Назад</a><br/ >';
		}
		else 
		{ 
			if ($pas!==$pas1) 
			{
				echo "Пароли не совпадают!<br/>";
				echo '<a href="reg.php">Назад</a><br/ >'; 
			}
			else
			{
				$pass=$pas;
				mysql_query("INSERT INTO users(login,pass) VALUES('$login','$pass')"); 
				$mode='regok';
				echo "Регистрация успешна!<br/ >";
				$_SESSION['login']=$login;
				$_SESSION['pass']=$pass;
				echo '<p><a href="/">На главную</a><br/ >';
			} 
		}
	}
else
{
	echo "Вы не ввели логин/пароль!<br/ >";
	echo '<a href="reg.php">Назад</a><br/ >';
}
}

echo '</div>';
?>