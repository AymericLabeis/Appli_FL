<?php
$pdo = new PDO('mysql:host=localhost;dbname=projet_fl', 'root', '');
// Vérifie si la variable GET 'carte' est définie
if (isset($_GET['carte'])) {
  // Requête SQL pour rechercher des recettes en fonction du terme de recherche
  $query = 'SELECT libelle FROM fruits_legumes WHERE libelle LIKE :searchTerm ORDER BY libelle ASC';
  $fruit_legume = $pdo->prepare($query);

  // Paramètre du terme de recherche avec le caractère joker "%" pour rechercher des correspondances partielles
  $searchTerm = '%' . $_GET['carte'] . '%';
  $fruit_legume->bindParam(':searchTerm', $searchTerm, PDO::PARAM_STR);
  $fruit_legume->execute();

  // Récupération des résultats
  $suggestions = $fruit_legume->fetchAll(PDO::FETCH_ASSOC);

  // Renvoie les suggestions au format JSON
  echo json_encode($suggestions);
  exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Recherche de Fruits et Légumes</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
  <style>
    #suggestionsList {
      display: none;
      list-style: none;
      padding: 0;
      margin: 0;
      border: 1px solid #ccc;
    }

    #suggestionsList li {
      padding: 8px;
      cursor: pointer;
    }

    #suggestionsList li:hover {
      background-color: #eee;
    }
  </style>
</head>
<body>

  <h1>Recherche de Fruits et Légumes</h1>

  <label for="carte">Rechercher :</label>
  <input type="text" id="carte" name="carte" placeholder="Commencez à taper...">

  <ul id="suggestionsList"></ul>

  <script>
    $(document).ready(function() {
      const carteInput = $('#carte');
      const suggestionsList = $('#suggestionsList');

      carteInput.on('input', function() {
        const searchTerm = carteInput.val();

        // Faites une requête AJAX pour récupérer les suggestions depuis le fichier PHP
        $.ajax({
          url: 'index.php',
          type: 'GET',
          dataType: 'json',
          data: { carte: searchTerm },
          success: function(data) {
            // Afficher les suggestions
            displaySuggestions(data);
          },
          error: function(xhr, status, error) {
  console.log('Erreur de requête AJAX : ', xhr.responseText);
  console.log('Statut de la requête : ', status);
  console.log('Erreur : ', error);
}
        });
      });

      function displaySuggestions(suggestions) {
  suggestionsList.empty();

  suggestions.forEach(suggestion => {
    const listItem = $('<li>').text(suggestion);
    listItem.on('click', function() {
      // Remplir le champ de recherche avec la suggestion sélectionnée
      carteInput.val(suggestion);
      // Cacher la liste de suggestions
      suggestionsList.hide();
    });

    suggestionsList.append(listItem);
  });

  // Afficher la liste de suggestions sous le champ de recherche
  suggestionsList.show();
}


      // Cacher la liste de suggestions lorsque l'utilisateur clique à l'extérieur
      $(document).on('click', function(e) {
        if (!$(e.target).closest('#suggestionsList, #carte').length) {
          suggestionsList.hide();
        }
      });
    });
  </script>

</body>
</html>
