<?php declare(strict_types=1);
session_start(); 

require_once('database.php');
$pdo = connectDB();

$error_user = "";
$error_mdp = "";
$pseudo = '';

function genererToken() {
    return bin2hex(random_bytes(32));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pseudo = htmlspecialchars($_POST['utilisateur'], ENT_QUOTES, 'UTF-8');
    $password = $_POST['password']; 

    // Vérifiez si l'utilisateur existe dans la base de données
    $query = $pdo->prepare('SELECT * FROM users WHERE name = ?');
    $query->execute([$pseudo]);
    $user = $query->fetch(PDO::FETCH_ASSOC);

    if ($user) {
        // L'utilisateur existe, vérifie maintenant le mot de passe
        if (password_verify($password, $user['password'])) {
            // Générez un token
            $token = genererToken();
            $timestamp = time();
    
            // Mettez à jour la base de données avec le nouveau token
            $query = $pdo->prepare('UPDATE users SET token = ? WHERE id = ?');
            $query->execute([$token, $user['id']]);
    
            // Stockez le token en session
            $_SESSION['id'] = $user['id']; 
            $_SESSION['pseudo'] = $pseudo; 
            $_SESSION['role'] = $user['role'];
            $_SESSION['token'] = $token;
            $_SESSION['timestamp'] = $timestamp; 
           
            header("Location: index.php");
            exit();
        } else {
            $error_mdp = "Mot de passe incorrect";
        }
    } else {
        $error_user = "Ce pseudo ($pseudo) n'existe pas";
    }
}
?>

<!DOCTYPE html >
<html lang="fr-FR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="fruits et légumes de saison">
    <title>connexion</title>
    <link href="https://fonts.googleapis.com/css2?family=Spicy+Rice&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Marck+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Paprika&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style_compte.css"> 
</head>
<header>
    <div class="logo_title">
    <a  href="index.php" id="InitialMonth"><img class= "logo" src="ressources/logo2.png" alt="Image du logo"></a>
      <h1 class="titre">Fusion Craft</h1>  
    </div>
  </header>
<body>
    <div class="box-login">
        <h1>Formulaire de Connexion</h1>
       <p class="inscription_link">Vous souhaitez devenir membre!!!<br><a href="inscription.php">Inscrivez-vous</a> dès maintenant</p>
<form action="" method="post">
    <div class="form-groupe">
        <label for="utilisateur">Pseudo</label>
        <input type="text" id="utilisateur" name="utilisateur" placeholder="" value="<?php echo htmlspecialchars($pseudo); ?>" autofocus="autofocus">
        <?php if (!empty($error_user)) : ?>
            <div class="error-account"><?= $error_user ?></div>
        <?php endif; ?>
    </div>
    <div class="form-groupe">
        <label for="password" class="form-label">Mot de passe</label>
        <input type="password" id="password" name="password" placeholder="">
        <?php if (!empty($error_mdp)) : ?>
            <div class="error-account"><?= $error_mdp ?></div>
        <?php endif; ?>
    </div>
    <button type="submit">Connexion</button>
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
    
</body> 
</html>
