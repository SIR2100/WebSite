<?php
error_reporting(E_ALL);
ob_start();
ob_implicit_flush(0);
session_name("login");
session_start();
// Finally, destroy the session.
session_destroy();
echo 'Сессия уничтожена! Перейти на <a href="index.php">Главную страницу</a>';
?>