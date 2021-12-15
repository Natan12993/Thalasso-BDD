<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
<head>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<nav>
<ul>
  <li><a href="home_page.php">Home page</a></li>
  <li><a href="tarif.php">Tarifs</a></li>
  <li><a href="prestations.php">Prestations</a></li>
  <li><a href="saison.php">Saison</a></li>
   <form name="admin_form" action="connexion_admin.php" method="post">
  <input type="submit" class = "otherbutton" name="admin" value="Administrateur";>
  </form>
</ul>
</nav>

<h4>Choisissez les différents éléments du séjour voulu pour obtenir un tarif final.</h4>

</body>
<form name="tarif_valid" action="" method="post">
  
  <?php
  include("connexion.inc.php");
  $request = "SELECT DISTINCT annee FROM saison";
  $resultats=$cnx->query($request);
  echo'<select class = "listderoul" name="annee" id="annee" />';
  echo'<option value="" selected="selected" hidden="hidden">annee</option>';
  foreach($resultats as $ligne){
    echo'<option value="'.$ligne['annee'].'">'.$ligne['annee'].'</option>';
  }
  echo'</select>';
  $resultats->closeCursor();
  ?>

  <?php
  include("connexion.inc.php");
  $request = "SELECT DISTINCT  libelle FROM saison";
  $resultats=$cnx->query($request);
  echo'<select class = "listderoul" name="libelle" id="libelle" />';
  echo'<option value="" selected="selected" hidden="hidden">Saison</option>';
  foreach($resultats as $ligne){
    echo'<option value="'.$ligne['libelle'].'">'.$ligne['libelle'].'</option>';
  }
  echo'</select>';
  $resultats->closeCursor();
  ?>

  <?php
  include("connexion.inc.php");
  $request = "SELECT DISTINCT typedechambre FROM hebergement";
  $resultats=$cnx->query($request);
  echo'<select class = "listderoul" name="typedechambre" id="typedechambre" />';
  echo'<option value="" selected="selected" hidden="hidden">Chambre</option>';
  foreach($resultats as $ligne){
    echo'<option value="'.$ligne['typedechambre'].'">'.$ligne['typedechambre'].'</option>';
  }
  echo'</select>';
  $resultats->closeCursor();
  ?>

  <?php
  include("connexion.inc.php");
  $request = "SELECT DISTINCT vue FROM hebergement";
  $resultats=$cnx->query($request);
  echo'<select class = "listderoul" name="vue" id="vue" />';
  echo'<option value="" selected="selected" hidden="hidden">Vue</option>';
  foreach($resultats as $ligne){
    echo'<option value="'.$ligne['vue'].'">'.$ligne['vue'].'</option>';
  }
  echo'</select>';
  $resultats->closeCursor();
  ?>

  <?php
  include("connexion.inc.php");
  $request = "SELECT DISTINCT nom FROM prestation";
  $resultats=$cnx->query($request);
  echo'<select class = "listderoul" name="nom" id="nom" />';
  echo'<option value="" selected="selected" hidden="hidden">Prestations</option>';
  foreach($resultats as $ligne){
    echo'<option value="'.$ligne['nom'].'">'.$ligne['nom'].'</option>';
  }
  echo'</select>';
  $resultats->closeCursor();
  ?>

  <?php
if((isset($_POST['typedechambre'])) AND (isset($_POST['vue']))){
  $typedechambre = $_POST['typedechambre'];
  $vue =$_POST['vue'];
}

if((isset($typedechambre)) AND (isset($vue))){
  include("connexion.inc.php");
  $request = "SELECT tarifhebergement FROM heberge NATURAL JOIN hebergement WHERE typedechambre = '$typedechambre' AND vue = '$vue'";
  $resultats=$cnx->query($request);
  $tarifhebergement = $resultats->fetch();
  $resultats->closeCursor();
}
  ?>

  <?php
if((isset($_POST['annee'])) AND (isset($_POST['libelle'])) AND (isset($_POST['nom']))){
  $annee = $_POST['annee'];
  $libelle = $_POST['libelle'];
  $nom = $_POST['nom'];
}

if((isset($annee)) AND (isset($libelle)) AND (isset($nom))){
  include("connexion.inc.php");
  $request = "SELECT tarif_saison FROM tarif NATURAL JOIN prestation NATURAL JOIN saison WHERE annee='$annee' AND libelle = '$libelle' AND nom = '$nom'";
  $resultats=$cnx->query($request);
  $tarifsaison = $resultats->fetch();
  $resultats->closeCursor();
}
  ?>

  <?php
  if ((isset($tarifhebergement)) AND $tarifhebergement[0]== 0){
    echo"<h6>Le tarif  d'hébergement n'existe pas</h6>";
  }
  elseif(isset($tarifhebergement)){
    echo"<h6>Le tarif de l'bébergement est de ".$tarifhebergement[0]."€</h6>";
  }

  if ((isset($tarifsaison)) AND $tarifsaison[0]== 0){
    echo"<h6>Le tarif de la saison n'existe pas</h6>";
  }
  elseif(isset($tarifsaison)){
    echo"<h6>Le tarif de la saison est de ".$tarifsaison[0]."€</h6>";
  }

  if ((isset($tarifhebergement)) AND (isset($tarifsaison)) AND $tarifhebergement[0]!= 0 AND $tarifsaison[0]!= 0){
    $tariftotal = $tarifhebergement[0] + $tarifsaison[0];
    echo'<h6>Le cout total sera de:'.$tariftotal.'€</h6>';
  }
  ?>

  <p><input type="submit" value="Valider"></p>
</form>
</html>