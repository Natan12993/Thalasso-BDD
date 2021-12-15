<?php
session_start();
if((isset($_SESSION['connect'])) AND $_SESSION['connect'] == 'oui'){

}
else{
	header('Location: home_page.php');
}

?>