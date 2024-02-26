<?php
require_once('database.php');
$pdo = connectDB();
require_once('session_function.php');
startSession();
updateLastAccess();
checkSession();

$id_utilisateur = $_SESSION['id'];

// Fonction pour récupérer les recettes avec leurs catégories
function getCateRecette($pdo, $id_utilisateur) {
    $query = "SELECT r.*, GROUP_CONCAT(rc.id_categories) AS categories_ids 
              FROM recettes r
              LEFT JOIN recettes_categories rc ON r.id_recettes = rc.id_recettes
              INNER JOIN users u ON r.id_users = u.id
              WHERE u.id = :id
              GROUP BY r.id_recettes
              ORDER BY r.id_recettes DESC";

    $recette = $pdo->prepare($query);
    $recette->bindParam(':id', $id_utilisateur, PDO::PARAM_INT);
    $recette->execute();
    return $recette->fetchAll(PDO::FETCH_ASSOC);
}

// Requête pour récupérer les recettes avec leurs catégories
$recettes = getCateRecette($pdo, $id_utilisateur);

// Requête pour récupérer les noms des catégories
$query_categories = "SELECT * FROM categories";
$categories_stmt = $pdo->query($query_categories);
$categories = $categories_stmt->fetchAll(PDO::FETCH_ASSOC);

// Traitement du formulaire de modification des catégories
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['id_recette']) && isset($_POST['categorie_id'])) {
        $id_recette = $_POST['id_recette'];
        $categorie_ids = $_POST['categorie_id'];

        try {
            $pdo->beginTransaction();

            // Supprime toutes les anciennes catégories associées à la recette
            $delete_query = "DELETE FROM recettes_categories WHERE id_recettes = :id_recette";
            $delete_stmt = $pdo->prepare($delete_query);
            $delete_stmt->bindParam(':id_recette', $id_recette, PDO::PARAM_INT);
            $delete_stmt->execute();

            // Insére les nouvelles catégories sélectionnées
            foreach ($categorie_ids as $categorie_id) {
                $insert_query = "INSERT INTO recettes_categories (id_recettes, id_categories) VALUES (:id_recette, :categorie_id)";
                $insert_stmt = $pdo->prepare($insert_query);
                $insert_stmt->bindParam(':id_recette', $id_recette, PDO::PARAM_INT);
                $insert_stmt->bindParam(':categorie_id', $categorie_id, PDO::PARAM_INT);
                $insert_stmt->execute();
            }

            // Valider la transaction
            $pdo->commit();
            // Rafraîchir les données des recettes avec les catégories mises à jour
            $recettes = getCateRecette($pdo, $id_utilisateur);
            $success = 'Catégories modifiées avec succès !';
        } catch (Exception $e) {
            // En cas d'erreur, annuler la transaction
            $pdo->rollBack();
            $error = 'Une erreur est survenue lors de la modification des catégories : ' . $e->getMessage();
        }
    }
}
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
    <link rel="stylesheet" href="style_categories.css">
</head>

<body>
    <header>
        <div class="logo_title">
            <a href="index.php" id="InitialMonth"><img class="logo" src="ressources/logo2.png" alt="Image du logo"></a>
            <h1 class="titre">Fusion Craft</h1>
        </div>
    </header>
    <h1 class="catTitle">Recettes par catégories</h1>
    <div class="container_categories">
        <?php foreach ($recettes as $recette) :  ?>
            <div class="categorie_upt">
                <form method="post"> <!-- Ajout du formulaire -->
                    <h2><?php echo $recette['nom']; ?></h2>
                    <input type="hidden" name="id_recette" value="<?php echo $recette['id_recettes']; ?>"> <!-- Champ caché pour l'ID de la recette -->
                    <select  name="categorie_id[]" multiple>
                        <?php foreach ($categories as $categorie) : ?>
                            <option value="<?php echo $categorie['id_categories']; ?>" <?php if (strpos($recette['categories_ids'], $categorie['id_categories']) !== false) echo 'selected'; ?>>
                                <?php echo $categorie['nom']; ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                    <button type="submit" class="modifier">Modifier</button>
                    <?php if (!empty($success)) : ?>
                <div class="success"><?= $success ?></div>
            <?php endif; ?>
                </form>
            </div>
        <?php endforeach; ?>
    </div>
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
