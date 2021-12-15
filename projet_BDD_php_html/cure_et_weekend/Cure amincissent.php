<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
  <link rel="stylesheet" href="style.css">
</head>
<body>

   <?php
    include("connexion.inc.php");
    $request = "SELECT libelle_soin,durree_estimee FROM soin NATURAL JOIN contient NATURAL JOIN prestation WHERE nom = 'Cure amincissent'";
    $resultats=$cnx->query($request);
    echo'<h6> Les soins qui composent cet prestation sonts : </h6>';
    foreach($resultats as $ligne){
      echo '<h6>'.$ligne['libelle_soin'].', il dure'.$ligne['durree_estimee'].' minutes</h6>';
    }
    $resultats->closeCursor();
  ?>

</body>
</html>