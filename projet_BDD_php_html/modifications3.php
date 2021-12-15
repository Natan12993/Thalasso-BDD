<?php
  if((isset($_SESSION['connect'])) AND $_SESSION['connect'] == 'oui'){

}
else{
	header('Location: home_page.php');
}
?>

<?php
if((isset($_POST['table']))){
    if($_POST['table'] == 'libelle'){
    echo"<input type='text' name='libelle' placeholder='saison'/> Nom de la saison";
    echo"<br><input type='text' name='datedebut' placeholder='aaaa-mm-jj'/> Date de début";
    echo"<br><input type='text' name='datefin' placeholder='aaaa-mm-jj'/> Date de fin";
    echo"<br><input type='text' name='annee' placeholder='aaaa'/> Année<br>";
  }
}
?>