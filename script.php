<?php
declare(strict_types=1);

// Connexion à la base de données
$host = 'localhost';
$dbname = 'projet_fl';
$user = 'root';
$password = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $user, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données: " . $e->getMessage());
}

// Vérifiez si la requête provient d'une méthode POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Vérifiez si la variable $action est définie
    if (isset($_POST['F_L'])) {
        $moisList = $_POST['mois'];
        $action = $_POST['F_L'];

        $query = 'SELECT flm.id_fruits_legumes, fl.libelle, fl.img, fl.img_dispo, fl.prix, fl.kilo_piece, fl.vitamines, fl.mineraux
                  FROM fruits_legumes_mois as flm
                  INNER JOIN fruits_legumes as fl ON fl.id_fruits_legumes = flm.id_fruits_legumes
                  WHERE id_mois = :moisList';

        if ($action === 'Fruit') {
            $query .= ' AND type="fruit"';
        } elseif ($action === 'Legume') {
            $query .= ' AND type="legume"';
        }

        $query .= ' ORDER BY fl.libelle ASC';

        //usleep(500000);
        $fruit_legume = $pdo->prepare($query);
        $fruit_legume->bindParam(':moisList', $moisList, PDO::PARAM_INT);
        $fruit_legume->execute();
        $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);
        error_log('Script PHP appelé');
        if (isset($action)) {
            error_log('Action : ' . $action);
        }
        if (isset($moisList)) {
            error_log('Mois : ' . $moisList);
        }
    }

    // Vérifiez si la variable $actionFL est définie
    if (isset($_POST['FL'])) {
        $actionFL = $_POST['FL'];
        $moisList = $_POST['mois'];

        $query = 'SELECT flm.id_fruits_legumes, fl.libelle, fl.img, fl.img_dispo, fl.prix, fl.kilo_piece, fl.vitamines, fl.mineraux
                  FROM fruits_legumes_mois as flm
                  INNER JOIN fruits_legumes as fl ON fl.id_fruits_legumes = flm.id_fruits_legumes
                  WHERE id_mois = :moisList';

        if ($action === 'Fruit') {
            $query .= ' AND type="fruit"';
        } elseif ($action === 'Legume') {
            $query .= ' AND type="legume"';
        }

        $query .= ' ORDER BY fl.libelle ASC';

        //usleep(500000);
        $fruit_legume = $pdo->prepare($query);
        $fruit_legume->bindParam(':moisList', $moisList, PDO::PARAM_INT);
        $fruit_legume->execute();
        $fruits_legumes = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);
        error_log('Script PHP appelé');
        if (isset($actionFL)) {
            error_log('ActionFL : ' . $actionFL);
        }
        if (isset($moisList)) {
            error_log('Mois : ' . $moisList);
        }
    }
}
?>
