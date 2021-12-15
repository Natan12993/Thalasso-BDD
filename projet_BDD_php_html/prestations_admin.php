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

  <?php
    include("connexion.inc.php");
    $request = "SELECT nom, description FROM prestation NATURAL JOIN cure";
    $resultats=$cnx->query($request);
    
    foreach($resultats as $ligne){
      echo'<h5><a href="cure_et_weekend/'.$ligne['nom'].'.php"> '.$ligne['nom'].'</a></h5>';
      echo'<img class ="image_prestation" src="image_prestations/'.$ligne['nom'].'.jpg" alt="" height="400" width="630" />';
      echo'<h6> Description : '.$ligne['description'].'</h6>';
    }

    $resultats->closeCursor();
  ?>

   <?php
    include("connexion.inc.php");
    $request = "SELECT nom FROM prestation WHERE nom LIKE 'Week%'";
    $resultats=$cnx->query($request);
    
    foreach($resultats as $ligne){
      echo'<h5><a href="cure_et_weekend/'.$ligne['nom'].'.php"> '.$ligne['nom'].'</a></h5>';
      echo'<img class ="image_prestation" src="image_prestations/'.$ligne['nom'].'.jpg" alt="" height="400" width="630" />';
    }

    $resultats->closeCursor();
  ?>

</body>
</html>