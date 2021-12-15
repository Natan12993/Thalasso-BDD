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
    $request = "SELECT annee, libelle,datedebut,datefin FROM saison NATURAL JOIN periode";
    $resultats=$cnx->query($request);

    echo'<h5> Tableaux de présentation des différentes saisons </h5>';
    
    echo'<table><thead><tr><th>Année</th><th>Saison</th><th>Date de début</th><th>Date de fin</th></tr></thead><tbody>';
    foreach($resultats as $ligne){
      echo'<tr><td>'.$ligne['annee'].'</td><td>'.$ligne['libelle'].'</td><td>'.$ligne['datedebut'].'</td><td>'.$ligne['datefin'].'</td></tr>';
    }
    echo'</tbody></table>';

    $resultats->closeCursor();
  ?>

</body>
</html>