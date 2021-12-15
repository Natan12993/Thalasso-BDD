<?php 
session_start();
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
  <link rel="stylesheet" href="style.css">
</head>

<body>

<h1>Veuillez vous enregistrer en tant qu'administrateur</h1>
<form name="admin_home_page" action="" method="post">
<input type='text' class='adminlog' name='login' placeholder='login'/><br>
<input type='password' class ='adminlog' name='motdepasse' placeholder='mot de passe'/>
<br><br>
<input type="submit" class='adminlogsub' name="submit" value="Valider" />
</form>

<?php
	$_SESSION['login'] = 'administrateur';
	$_SESSION['mdp'] = 'azerty123';
	$admin_login = $_SESSION['login'];
	$admin_mdp = $_SESSION['mdp'];

	if (isset($_POST['submit'])) {

		$login = !empty($_POST['login']) ? $_POST['login'] : NULL;
		$mdp = !empty($_POST['motdepasse']) ? $_POST['motdepasse'] : NULL;

			if ($admin_login == $login AND $admin_mdp == $mdp){
				header("Location:home_page_admin.php");
				$_SESSION['connect'] = 'oui';
			}
			elseif ($admin_login != $login){
				echo'<h2> login incorrect </h2>';
			}
			else {
				echo'<h2> mot de passe incorrect </h2>';
			}
	}
?>


</body>
</html>

		

