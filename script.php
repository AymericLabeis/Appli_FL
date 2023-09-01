<?php declare(strict_types=1);

$pdo = new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');
if (isset($_POST['constante_js'])) {
  $moisIndex = $_POST['constante_js']; 

  
  // Requête préparée pour récupérer les fruits et légumes du mois en cours
  $query = 'SELECT flm.id_fruits_legumes, fl.libelle, fl.img, fl.img_dispo, fl.prix, fl.kilo_piece ,fl.vitamines, fl.mineraux
            FROM fruits_legumes_mois as flm
            INNER JOIN fruits_legumes as fl ON fl.id_fruits_legumes = flm.id_fruits_legumes
            WHERE id_mois = :moisIndex
            ORDER BY fl.libelle ASC';

  $fruit_legume = $pdo->prepare($query);
  $fruit_legume->bindParam(':moisIndex', $moisIndex, PDO::PARAM_INT);
  $fruit_legume->execute();
  $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);

  echo $moisIndex;
}?>
