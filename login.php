<?php
error_reporting(E_ALL);
ob_start();
ob_implicit_flush(0);
session_name("login");
session_start();

require("config.php");
if (isset($_REQUEST['mode'])) {$mode=$_REQUEST['mode'];}

echo '<div class="title">Авторизация</div>';

echo '<div class="b">';

if (!$_SESSION['login']) {
echo '<form action="?mode=aut" method="post" name="form">';
echo 'Логин:<br/><input name="login" type="text" maxlength="30" /><br/>';
echo 'Пароль:<br/><input name="pass" type="text" maxlength="30" /><br/>';
echo '<input name="submit" type="submit" value="Войти" /></form></div>';

$_REQUEST['login']=htmlspecialchars(mysql_real_escape_string($_POST['login']));
$_REQUEST['pass']=htmlspecialchars(mysql_real_escape_string($_POST['pass']));
}
else
{echo'Все ок! <br>';}

if ($mode=="aut")
{
$login=$_REQUEST['login'];
$pass=$_REQUEST['pass'];


if ($login!=="" AND $pass!=="")
{
$res=mysql_query("SELECT * FROM anket WHERE login='$login' AND pass='$pass'");
   if (mysql_num_rows($res)!=0) 
{
$_SESSION['login']=$login;
$_SESSION['pass']=$pass;
echo 'Авторизация успешна! (login.php)<p>';
}
else { 
$nm=mysql_num_rows($res);
echo "Такой логин еще не зарегистрирован!";
echo '</div>';
echo '<a href="login.php">Назад</a>';
}
}
else {
echo "Вы не ввели логин/пароль";
echo '</div>';
echo '<a href="login.php">Назад</a>';
}
}
?>