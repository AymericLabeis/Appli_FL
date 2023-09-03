<?php declare(strict_types=1);

$pdo = new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');
$moisIndex = date('n');

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


if (isset($_GET['carte'])) {
  // Requête SQL pour rechercher des recettes en fonction du terme de recherche
  $query = 'SELECT * FROM fruits_legumes WHERE libelle LIKE :searchTerm
  ORDER BY libelle ASC';
  $fruit_legume = $pdo->prepare($query);

  // Paramètre du terme de recherche avec le caractère joker "%" pour rechercher des correspondances partielles
  $searchTerm = '%' . $_GET['carte'] . '%';
  $fruit_legume->bindParam(':searchTerm', $searchTerm, PDO::PARAM_STR);
  $fruit_legume->execute();

  // Récupération des résultats
  $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  if (isset($_POST['action'])) {
      $moisList = $_POST['mois'];
      $action = $_POST['action']; 
      
      if ($action === 'Fruit') {
          $query = 'SELECT flm.id_fruits_legumes, fl.libelle, fl.img, fl.img_dispo, fl.prix, fl.kilo_piece, fl.vitamines, fl.mineraux
              FROM fruits_legumes_mois as flm
              INNER JOIN fruits_legumes as fl ON fl.id_fruits_legumes = flm.id_fruits_legumes
              WHERE id_mois = :moisList AND type="fruit"
              ORDER BY fl.libelle ASC';

          $fruit_legume = $pdo->prepare($query);
          $fruit_legume->bindParam(':moisList', $moisList,  PDO::PARAM_INT);
          $fruit_legume->execute();
          $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);

      } elseif ($action === 'Legume') {
          $query = 'SELECT flm.id_fruits_legumes, fl.libelle, fl.img, fl.img_dispo, fl.prix, fl.kilo_piece, fl.vitamines, fl.mineraux
              FROM fruits_legumes_mois as flm
              INNER JOIN fruits_legumes as fl ON fl.id_fruits_legumes = flm.id_fruits_legumes
              WHERE id_mois = :moisList AND type="legume"
              ORDER BY fl.libelle ASC';

          $fruit_legume = $pdo->prepare($query);
          $fruit_legume->bindParam(':moisList', $moisList,  PDO::PARAM_INT);
          $fruit_legume->execute();
          $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);
          
      }
  }
}
?>
<!DOCTYPE html >
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="fruits et légumes de saison">
    <title>MFLS</title>
    <link href="https://fonts.googleapis.com/css2?family=Marck+Script&family=Open+Sans:ital@1&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css"> 
</head>
<body>
  <header>
    <div class="logo_title">
      <a  href="index.php" id="InitialMonth"><img class= "logo" src="ressources/logo2.png" alt="Image du logo"></a>
      <h1 class="titre">Mes fruits et légumes de saison</h1>
    </div>
  </header>
  <nav>
     <div class="menu">
      <div class ="recherche_FL">
       <form class="formSearch" method="get">
        <input type="text" name="carte" placeholder="Rechercher un fruit ou un légume" value="<?= htmlspecialchars($_GET['carte'] ?? '') ?>">
        <button type="submit" >Rechercher</button>
       </form>
      </div> 
       <form class="formFL"  method="post">
        <div class ="button_FL">
        <select id="mois" name="mois">
          <option value="01">Janvier</option>
          <option value="02">Février</option>
          <option value="03">Mars</option>
          <option value="04">Avril</option>
          <option value="05">Mai</option>
          <option value="06">Juin</option>
          <option value="07">Juillet</option>
          <option value="08">Août</option>
          <option value="09">Septembre</option>
          <option value="10">Octobre</option>
          <option value="11">Novembre</option>
          <option value="12">Décembre</option>
        </select>
        <button type="submit" id="btnFLR" class="button_F" name="action" value="Fruit">Fruits</button>
        <button type="submit" id="btnFLR" class="button_L" name="action" value="Legume">Légumes</button>
       </div>
       </form>
       <div class ="button_Recettes">
      <a href="Recettes.php" id="btnFLR" class="btn_Recettes" >Recettes</a>
       </div> 
       <div class="RoueSelect" id="moisRoue">
        <button class="buttonR janvier" value="01" draggable="true" ondragstart="dragStart(event)"><h2>Janvier</h2></button>
        <button class="buttonR fevrier" value="02" draggable="true" ondragstart="dragStart(event)"><h2>Février</h2></button>
        <button class="buttonR mars"  value="03" draggable="true" ondragstart="dragStart(event)"><h2>Mars</h2></button>
        <button class="buttonR avril" value="04" draggable="true" ondragstart="dragStart(event)"><h2>Avril</h2></button>
        <button class="buttonR mai" value="05" draggable="true" ondragstart="dragStart(event)"><h2>Mai</h2></button>
        <button class="buttonR juin" value="06" draggable="true" ondragstart="dragStart(event)"><h2>Juin</h2></button>
        <button class="buttonR juillet" value="07" draggable="true" ondragstart="dragStart(event)"><h2>Juillet</h2></button>
        <button class="buttonR aout" value="08" draggable="true" ondragstart="dragStart(event)"><h2>Août</h2></button>
        <button class="buttonR septembre" value="09" draggable="true" ondragstart="dragStart(event)"><h2>Septembre</h2></button>
        <button class="buttonR octobre" value="10" draggable="true" ondragstart="dragStart(event)"><h2>Octobre</h2></button>
        <button class="buttonR novembre" value="11" draggable="true" ondragstart="dragStart(event)"><h2>Novembre</h2></button>
        <button class="buttonR decembre" value="12" draggable="true" ondragstart="dragStart(event)"><h2>Decembre</h2></button>
      </div>
      <div class="fleches">
       <img class="flecheG" src="ressources/flecheG.png" alt="flèche gauche" onclick="tournerRoue(-30)">
       <img class="flecheD" src="ressources/flecheD.png" alt="flèche droite" onclick="tournerRoue(30)">
      </div>
  <!-- Formulaire caché pour envoyer la requête -->
  <form id="formulaireRecherche" action="index.php" method="POST">
      <input type="hidden" name="direction" id="direction">
  </form>
      </div>  
  </nav>

   <div class="container_carte" >
   <?php if (empty($fruits_legumes)) : ?>
        <h3>Aucune carte de fruit ou de légume trouvée</h3>
    <?php else : ?>
   <?php foreach($fruits_legumes as $fruit_legume): ?>
    <div class="carte">
      <div class="double-face">
          <div class="face">
              <img src="ressources/FL/<?= $fruit_legume['img']?>" alt="<?= $fruit_legume['img']?>">
              <h2><?= $fruit_legume['libelle']?></h2>
          </div>
          <div class="arriere">
            <img src="ressources/img_dispo/<?= $fruit_legume['img_dispo']?>">
            <div class="carte_info">
              <div class="info">
                <h4><?= $fruit_legume['prix']?><?= $fruit_legume['kilo_piece']?></h4>
              </div>
              <div class="info">
                <h3>Vitamines:</h3>
                <p><?= $fruit_legume['vitamines']?></p>
              </div>
              <div class="info">
                <h3>Mineraux:</h3>
                <p> <?= $fruit_legume['mineraux']?>
                </p>

              </div>
              </div>
            <a href="recettes.php?carte=<?=$fruit_legume['libelle']?>">Idée Recette</a>
          </div>
      </div>
     </div>
      <?php endforeach ?>
      <?php endif; ?>
   </div>


    <footer class="footerMobil">
    <div class="footerL">
      <a href="index.php">Accueil</a>
    </div>
    <div class="footerR">
      <a href="Recettes.php">Recettes</a>
    </div>
    </footer>
    <footer class="footerDesktop">
       <h2>Aymeric LABEIS copyright 2023</h2>
    </footer>
   
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="app.js"></script>
</body>
</html>
<?php
