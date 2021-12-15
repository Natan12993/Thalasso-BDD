<?php
  include('test_session_admin.php');
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<nav>
<ul>
  <li><a href="home_page_admin.php">Home page</a></li>
  <li><a href="tarif_admin.php">Tarifs</a></li>
  <li><a href="prestations_admin.php">Prestations</a></li>
  <li><a href="saison_admin.php">Saison</a></li>
  <li><a href="modifications.php">Modifications</a></li>
  <form name="disconnect_form" action="deconnexion.php" method="post">
  <input type="submit" class = "otherbutton" name="disconnect" value="Déconnexion";>
  </form>
  <h3>Vous etes connecté en tant qu'Administrateur </h3>
</ul>
</nav>
<h4> Centre thalassothérapie du Touquet </h4>
<img class ="image_home_page" src="thalasso.jpg" alt="" />
</body>
</html>