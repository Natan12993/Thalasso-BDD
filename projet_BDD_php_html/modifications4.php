<?php
  include('test_session_admin.php');
?>

<?php

  if((isset($_POST['libelle'])) AND (isset($_POST['datedebut'])) AND (isset($_POST['datefin'])) AND (isset($_POST['annee']))){
    $libelle = $_POST['libelle'];
    $annee = $_POST['annee'];
    $datedebut = $_POST['datedebut'];
    $datefin = $_POST['datefin'];
    include("connexion.inc.php");
    $request = "INSERT INTO saison (annee,libelle) VALUES('$annee','$libelle')";
    $resultats=$cnx->query($request);
    $request2 = "INSERT INTO periode (datedebut,datefin) VALUES('$datedebut','$datefin')";
    $resultats2=$cnx->query($request2);
    header('Location: modifications.php');
  }
?>