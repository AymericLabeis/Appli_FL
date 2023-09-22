<?php
session_start(); // Démarrez la session

$pdo = new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');
$id_utilisateur = $_SESSION['id'];

$query = "SELECT fl.* FROM fruits_legumes fl
          INNER JOIN users u ON fl.id_users = u.id
          WHERE u.id = :id
          ORDER BY libelle ASC";

$fruit_legume = $pdo->prepare($query);
$fruit_legume->bindParam(':id', $id_utilisateur, PDO::PARAM_INT);
$fruit_legume->execute();
$fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="fruits et légumes de saison">
    <title>MFLS</title>
    <link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Paprika&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style_mesrecettes_fiches.css"> 
</head>
<body>
<header>
    <div class="box-login">
        <?php if (isset($_SESSION['pseudo'])): ?>
            <h2>Bienvenue <?php echo $_SESSION['pseudo']; ?> (ID: <?php echo $_SESSION['id']; ?>)</h2>
        <?php else: ?>
            <h2>non connecté</h2>
        <?php endif; ?>
    </div>
    <div class="logo_title">
        <a href="index.php" id="InitialMonth"><img class="logo" src="ressources/logo2.png" alt="Image du logo"></a>
        <h1 class="titre">Mes fruits et légumes de saison</h1>  
    </div>
</header>
<?php if (empty($fruits_legumes)) : ?>
    <h3 class="errorR">Pas encore de fruits ou légumes associés !!! </h3>
<?php else : ?>
    <?php foreach ($fruits_legumes as $fruit_legume):  ?>
        <div class="mesDonnées">
            <h2><?php echo $fruit_legume['libelle']; ?></h2>
            <div class="btn_upt">
              
                <a href=""><button type="submit" class="modifier">Modifier</button></a>
                <form method="POST">
                    <button type="submit" class="supprimer">Supprimer</button>
                </form>
            </div>
        </div>
    <?php endforeach; ?>
<?php endif; ?>
<a href="add_fruit_legume.php"><button type="submit" class="ajouter">Ajouter un fruit ou légume</button></a>
<footer class="footerMobil">
    <div class="footerL">
        <a href="index.php">Accueil</a>
    </div>
    <div class="footerR">
        <a href="Recettes.php">Recettes</a>
    </div>
</footer>
</body>
</html>
