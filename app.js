const Roue = document.querySelector('.RoueSelect');
const buttonsRoue = document.querySelectorAll('.buttonR');
const cartes = document.querySelectorAll('.carte');
const storedMonth = localStorage.getItem('selectedMonth');
const moisActuel = storedMonth ? parseInt(storedMonth) : new Date().getMonth() + 1;
const moisActuelList= document.getElementById('mois');
const rotationSpeedFactor = 0.8; 
var activeButton = null;
var initialX = 0;
var angleRotation = 0; 
        
document.addEventListener('DOMContentLoaded', function() {
  var deleteLS = document.getElementById('InitialMonth');
  deleteLS.addEventListener('click', function(event) {
  event.preventDefault();
  localStorage.clear();
  window.location.href = "index.php";
  });
});

// Mettre à jour la liste déroulante avec le mois actuel
moisActuelList.value = (moisActuel < 10 ? '0' : '') + moisActuel;
console.log('Index list', moisActuelList.value);

// Position de la roue automatique en fonction du mois actuel
function CurrentMonthRoue() {
  var rotationIncrement = 30;
  var currentMonthIndex = moisActuel; // Vous devez déclarer moisActuel
  console.log('Index mois en cours', currentMonthIndex);

  var initialRotation = 180; // Rotation initiale de la roue
  var currentButtonIndex = (-currentMonthIndex) % 12;

  // Calculer l'angle de rotation pour placer le bouton en bas
  var degrees = initialRotation + rotationIncrement * currentButtonIndex;
  Roue.style.transform = 'rotate(' + degrees + 'deg)';
  angleRotation = degrees;
  console.log('rotation CurrentMonthIndex', degrees);
}
// Appelez la fonction pour positionner le mois en cours
CurrentMonthRoue();
//let moisIndex = <?php echo $moisIndex; ?>; // Récupérer la valeur initiale de moisIndex depuis PHP
function tournerRoue(degrees) {
  angleRotation += degrees;
  Roue.style.transform = `rotate(${angleRotation}deg)`;
  // Augmenter ou diminuer la valeur de l'index de la liste déroulante d'une unité
  if (degrees > 0) {
    moisActuelList.selectedIndex = (moisActuelList.selectedIndex -1 + moisActuelList.length) % moisActuelList.length;
  } else {
    moisActuelList.selectedIndex = (moisActuelList.selectedIndex +1 + moisActuelList.length) % moisActuelList.length;
  }
  // Stocker la valeur sélectionnée dans le Local Storage
  localStorage.setItem('selectedMonth', moisActuelList.value);
  interrogerBaseDeDonnees(direction);
}

/*function interrogerBaseDeDonnees(direction) {
  // Remplir la valeur de l'input "direction" dans le formulaire
  document.getElementById('direction').value = direction;
  
  // Soumettre le formulaire
  document.getElementById('formulaireRecherche').submit();
}*/

// Détecter l'envoi du formulaire et stocker le mois sélectionné dans le Local Storage
moisActuelList.addEventListener('change', function () {
  var selectedMonth = parseInt(moisActuelList.value);
  localStorage.setItem('selectedMonth', selectedMonth);
});

//Mouvement de la roue de selection       
function dragStart(event) {
  activeButton = event.target;
  initialX = event.clientX;
  document.addEventListener('mousemove', dragMove);
  document.addEventListener('mouseup', dragEnd);
}

function dragMove(event) {
  if (activeButton) {
    var deltaX = event.clientX - initialX;
    var rotationIncrement = 30; // Incrémentation de la rotation en degrés
    var degrees = Math.floor(deltaX / rotationIncrement) * rotationIncrement;

    // Calculer la vitesse de rotation basée sur le mouvement de la souris
    var rotationSpeed = deltaX * rotationSpeedFactor;

    // Appliquer la rotation avec la vitesse
    Roue.style.transform = 'rotate(' + degrees + 'deg)';
    Roue.style.transition = 'transform ' + Math.abs(rotationSpeed) + 'ms linear';
  }
}

// Fonction pour gérer la fin du glisser-déposer
function dragEnd() {
  if (activeButton) {
    var bottomButton = null;
    var bottomButtonY = -Infinity;

    // Loop through each button in the buttonsRoue array
    buttonsRoue.forEach(function(button) {
      var rect = button.getBoundingClientRect();
      var buttonY = rect.top + rect.height;

      if (buttonY > bottomButtonY) {
        bottomButton = button;
        bottomButtonY = buttonY;
      }
    });

    if (bottomButton) { 
      const monthRoue = bottomButton.value;
      console.log('Index Roue mois', monthRoue);
      document.getElementById('mois').value = monthRoue;
      // Store the selected month's value in local storage
      localStorage.setItem('selectedMonth', monthRoue, );
    }
  }
  activeButton = null;
  document.removeEventListener('mousemove', dragMove);
  document.removeEventListener('mouseup', dragEnd);
}
// affichage des cartes

let carteRetournee = false;
let premiereCarte, secondeCarte;
let verouillage = false;

cartes.forEach(carte => {
    carte.addEventListener('click', retourneCarte)
})

function retourneCarte(){
    if(verouillage)return; 
        this.childNodes[1].classList.toggle('active');
    if(!carteRetournee){
  carteRetournee = true;
        premiereCarte = this;
        return;
    }
    carteRetournee = false;
    secondeCarte = this;
}










