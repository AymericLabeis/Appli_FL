<?php
$pdo = new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');

$name = '';
$email = '';
$password = '';
$errorName = '';
$errorEmail = '';
$errorPassword = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['utilisateur'];
    $email = $_POST['email'];
    $password = $_POST['mdp'];
    $passwordConfirm = $_POST['mdpconf']; // Champ de confirmation du mot de passe
    
    // Vérifiez la longueur du nom d'utilisateur
    if (strlen($name) >= 3 && strlen($name) <= 24) {
        // Vérifiez si le champ email est vide
        if (!empty($email)) {
            // Vérifiez si le champ de mot de passe est vide
            if (!empty($password)) {
                // Vérifiez si les deux mots de passe correspondent
                if ($password === $passwordConfirm) {
                    // Vérifiez d'abord si le nom d'utilisateur est déjà présent dans la base de données
                    $existingNameQuery = $pdo->prepare('SELECT COUNT(*) FROM users WHERE name = ?');
                    $existingNameQuery->execute([$name]);
                    $nameCount = $existingNameQuery->fetchColumn();

                    // Vérifiez si l'email est déjà présent dans la base de données
                    $existingEmailQuery = $pdo->prepare('SELECT COUNT(*) FROM users WHERE email = ?');
                    $existingEmailQuery->execute([$email]);
                    $emailCount = $existingEmailQuery->fetchColumn();

                    if ($nameCount > 0) {
                        $errorName = 'Ce pseudo est déjà utilisé.';
                    } elseif ($emailCount > 0) {
                        $errorEmail = 'Cette adresse email est déjà utilisée.';
                    } else {
                        // Si toutes les conditions sont satisfaites, enregistrez les données dans la base de données
                        $query = $pdo->prepare('INSERT INTO users (name, email, password) VALUES (?, ?, ?)');
                        $hashedPassword = password_hash($password, PASSWORD_DEFAULT); // Hachez le mot de passe
                        $query->execute([$name, $email, $hashedPassword]);

                        // Vérifiez si l'inscription a réussi
                        if ($query->rowCount() > 0) {
                            $success = 'Compte crée avec succès !';
                            
                            // Réinitialisez les valeurs des champs
                            $name = '';
                            $email = '';
                            $password = '';
                        } else {
                            $error = 'Une erreur s\'est produite lors de la création du compte.';
                        }
                    }
                } else {
                    $errorPassword = 'Les mots de passe ne correspondent pas.';
                }
            } else {
                $errorPassword = 'Entrez un mot de passe';
            }
        } else {
            $errorEmail = 'Entrez une adresse e-mail';
        }
    } else {
        $errorName = 'Le pseudo doit contenir entre 3 et 24 caractères.';
    }
}

?>

<!DOCTYPE html>
<html lang="FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="fruits et légumes de saison">
    <title>MFLS</title>
    <link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Paprika&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style_compte.css"> 
</head>
<body>
<header>
    <div class="logo_title">
      <a  href="index.php" id="InitialMonth"><img class= "logo" src="ressources/logo2.png" alt="Image du logo"></a>
      <h1 class="titre">Mes fruits et légumes de saison</h1>  
    </div>
  </header>
  <div class="box-account">
    <h1>Inscrivez-vous.</h1>
        <form method="post" action="">
            <div class="form-groupe">
                <label for="utilisateur">Pseudo</label>
                <input type="text" id="utilisateur" name="utilisateur" placeholder="Nom d'utilisateur" maxlength="24"value="<?= htmlspecialchars($name) ?>">
                <img src="ressources/check.svg" alt="icone de validation" class="icone-verif">
                <span class="message-alerte">Choisissez un pseudo entre 3 et 24 caractères</span>
                <?php if (!empty($errorName)) : ?>
                <div class="error-account"><?= $errorName?></div>
            <?php endif; ?>
            </div>
            <div class="form-groupe">
                <label for="email">Entrez votre mail</label>
                <input type="email" id="email" name="email" placeholder="Votre mail" value="<?= htmlspecialchars($email) ?>">
                <img src="ressources/check.svg" alt="icone de validation" class="icone-verif">
                <span class="message-alerte">Rentrez un email valide.</span>
                <?php if (!empty($errorEmail)) : ?>
                <div class="error-account"><?= $errorEmail?></div>
            <?php endif; ?>
            </div>
            <div class="form-groupe">
                <label for="mdp">Mot de passe</label>
                <input type="password" id="mdp"name="mdp" placeholder="Mot de passe" required>
                <img src="ressources/check.svg" alt="icone de validation" class="icone-verif">
                <span class="message-alerte">Un symbole, une lettre minuscule, un chiffre.</span>
                <?php if (!empty($errorPassword)) : ?>
                <div class="error-account"><?= $errorPassword?></div>
            <?php endif; ?>
                <div class="ligne">
                    <div class="l1"><span>faible</span></div>
                    <div class="l2"><span>moyen</span></div>
                    <div class="l3"><span>fort</span></div>
                </div>
            </div>
            <div class="form-groupe">
                <label for="mdpconf">Confirmer le mot de passe</label>
                <input type="password" id="mdpconf" name="mdpconf" placeholder="Confirmez le mot de passe" required>
                <img src="ressources/check.svg" alt="icone de validation" class="icone-verif">
            </div>
            
            <button type="submit">Créer un compte</button>
            <?php if (!empty($success)) : ?>
                <div class="success"><?= $success ?></div>
            <?php endif; ?>
        </form> 
 </div>
    <footer class="footerMobil">
    <div class="footerL">
      <a href="index.php">Accueil</a>
    </div>
    <div class="footerR">
      <a href="Recettes.php">Recettes</a>
    </div>
    </footer>
    
 <script src="appCompte.js"></script>
</body>
</html>