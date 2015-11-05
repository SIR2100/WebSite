<?php
ob_start();
ob_implicit_flush(0);
session_name("login");
session_start();
echo'<link href="style.css" rel="stylesheet">';


require("config.php");
if (isset($_REQUEST['mode'])) {$mode=$_REQUEST['mode'];}


if (!isset($_SESSION['login'])) {
	echo '<form method="post" name="form">';
	echo 'Логин:<br/><input name="login" type="text" maxlength="30" /><br/>';
	echo 'Пароль:<br/><input name="pass" type="text" maxlength="30" /><br/>';
	echo '<input name="submit" type="submit" value="Войти" /></form>';
	$login=htmlspecialchars(mysql_real_escape_string($_POST['login']));
	$pass=md5($_POST['pass']);
	if (isset($login) && isset($pass))
	{
		$res=mysql_query("SELECT * FROM users WHERE login='$login' AND pass='$pass'");
		if (mysql_num_rows($res)!=0)
		{
			echo"Удачная авторизация!";
			$_SESSION['login']=$login;
			header('location:'.$_SERVER['HTTP_REFERER']);
		}
		else 
		{ 
			if ($_POST['login'] != "") 
			{
				echo "В авторизации отказано!";
			}
		}
	}
}
else
{
if (isset($_SESSION["login"])) 
{
echo "Hello, ".$_SESSION["login"]."";
echo ' (<a href="?mode=exit"">Выход</a>)<br>';
$res=mysql_query("SELECT * FROM `users` WHERE `login`='$_SESSION[login]'");
$row = mysql_fetch_assoc($res);
} 
if ($row[access]=="user" || $row[access]=="admin") 
{ 	echo "У Вас есть доступ к:<br>";
	echo "-<br>";
	echo "-<br>";
	echo "-<br>";
	echo '<form action="?mode=regkey" method="post" name="form">';
	echo 'Расширить доступ:<br/><input name="code" type="text" maxlength="30" />';
	echo '<input name="submit" type="submit" value="Применить" /></form>';}
}
if (($mode=='regkey') && (isset($_SESSION['login']))) 
{	
	$key=htmlspecialchars(mysql_real_escape_string($_POST['code']));
	$res=mysql_query("SELECT * FROM `access` WHERE `key`='$key'");
		if (mysql_num_rows($res)!=0)
		{
			echo"Открыт доступ к: ";
			$row = mysql_fetch_assoc($res);
		}
		mysql_query("UPDATE users SET `section`='$row[section]' WHERE `login`=$_SESSION[login]"); 
		mysql_query("UPDATE access SET `used`='1' WHERE `key`='$key'");
}
//Меню администратора
if ($row[access]=="admin") 
{
	echo "Управление<br>";
	echo "<a href='?mode=edit'>Edit user</a> | <a href='?mode=newkey'>Create new key</a><br>";
}
if (($mode=='edit') && (isset($_SESSION['login']))) 
{
	echo '<form method="post" name="form">';
	echo 'Логин:<br/><input name="login" type="text" maxlength="30" /><br/>';
	echo 'Пароль:<br/><input name="pass" type="text" maxlength="30" /><br/>';
	echo 'Доступ:<br/><input name="access" type="text" maxlength="30" /><br/>';
	echo '<input name="submit" type="submit" value="Изменить" /></form>';
	
	$elogin=htmlspecialchars(mysql_real_escape_string($_POST['login']));
	$eaccess=htmlspecialchars(mysql_real_escape_string($_POST['access']));
	if ((isset($_POST['pass'])) && (isset($_SESSION["login"])))
	{
		$epass=md5($_POST['pass']);
		mysql_query("UPDATE users SET `access`='$eaccess', pass='$epass' WHERE `login`='$elogin'"); 
	}
	mysql_query("UPDATE users SET `access`='$eaccess' WHERE `login`='$elogin'"); 
}
if (($mode=='newkey') && (isset($_SESSION['login']))) 
{
	echo '<form method="post" name="form">';
	echo 'Раздел:<br/>';
	echo '<select name="section" size="1"">';
    echo '<option value="r1">Сети</option>';
	echo '<option value="r2">БД</option>';
	echo '<option value="r3">Раздел 3</option>';
    echo '</select><br>';
	echo 'Ключ:<br/><input name="key" type="text" maxlength="30" value="" /><br/>';
	echo '<input name="submit" type="submit" value="Добавить" /></form>';
	
	$key=htmlspecialchars(mysql_real_escape_string($_POST['key']));
	$section=htmlspecialchars(mysql_real_escape_string($_POST['section']));
	if ((isset($_SESSION["login"])) && ($key!=''))
	{
		mysql_query("INSERT INTO access(`section`,`key`) VALUES('$section','$key')"); 
	}
	else
	{	if ($section!='')
		{
			echo'Ключ не был добавлен!';
		}
		
	}
}
if (($mode=='exit') && (isset($_SESSION['login']))) 
{
	session_destroy();
	echo 'Сессия была уничтожена! Перейти на <a href="index.php">Главную страницу</a>';
}
?>