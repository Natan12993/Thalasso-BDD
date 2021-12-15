<?php

$user =  "nburin";
$pass =  "natanburin";
try {
    $cnx = new PDO("pgsql:host=sqletud.u-pem.fr;dbname=nburin_db", $user, $pass);
}
catch (PDOException $e) {
    echo "ERREUR : La connexion a échouée";

}

?>

