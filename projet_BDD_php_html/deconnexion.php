<?php
session_start();

if ((isset($_POST['disconnect']))) {
    header('Location: home_page.php');
    session_destroy();
}

?>