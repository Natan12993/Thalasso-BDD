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

<form method="POST" action="modifications2.php">

  <input type="radio" name="choix" value="choix" checked="checked"/>Choississez la table dont vous voulez rajouter une valeur<br>
  <br><input type="radio" name="table" value="libelle"/>Saison<br>
  <br><input type="submit" value="Valider">

</form>
</body>
</html>