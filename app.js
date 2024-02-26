const Roue = document.querySelector('.RoueSelect');
const buttonsRoue = document.querySelectorAll('.buttonR');
const cartes = document.querySelectorAll('.carte');
const storedMonth = localStorage.getItem('selectedMonth');
let moisActuel = storedMonth ? parseInt(storedMonth) : new Date().getMonth() + 1;
const moisActuelList= document.getElementById('mois');
const rotationSpeedFactor = 0.8; 
const postMonth = document.querySelector('.moisSelectionne');
let activeButton = null;
let initialX = 0, angleRotation = 0;
const initialRotation = 180; 
const rotationIncrement = -30;

// Mettre à jour la liste déroulante avec le mois actuel
moisActuelList.value = (moisActuel < 10 ? '0' : '') + moisActuel;

// Position de la roue automatique en fonction du mois actuel
function CurrentMonthRoue() {
  // Calcul l'angle de rotation pour placer le bouton en bas
  const degrees = initialRotation + rotationIncrement * moisActuel;
  Roue.style.transform = 'rotate(' + degrees + 'deg)';
  angleRotation = degrees;
}
CurrentMonthRoue();

function rotateRoue(degrees) {
  angleRotation += degrees;
  Roue.style.transform = `rotate(${angleRotation}deg)`;
  // Augmenter ou diminuer la valeur de l'index de la liste déroulante d'une unité
  moisActuelList.selectedIndex = (moisActuelList.selectedIndex - (degrees > 0 ? 1 : -1) + moisActuelList.length) % moisActuelList.length;
  // Stocker la valeur sélectionnée dans le Local Storage
  localStorage.setItem('selectedMonth', moisActuelList.value);
}

// Détecter l'envoi du formulaire et stocker le mois sélectionné dans le Local Storage
moisActuelList.addEventListener('change', function () {
  const selectedMonth = parseInt(moisActuelList.value);
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
    const deltaX = event.clientX - initialX;
    const degrees = Math.floor(deltaX / rotationIncrement) * rotationIncrement;
    const rotationSpeed = deltaX * rotationSpeedFactor;

    Roue.style.webkitTransform = `rotate(${degrees}deg)`;
    Roue.style.transform = `rotate(${degrees}deg)`;
    Roue.style.transition = `transform ${Math.abs(rotationSpeed)}ms linear`;
  }
}

function dragEnd() {
  if (activeButton) {
    let bottomButton = null;
    let bottomButtonY = -Infinity;

    buttonsRoue.forEach(function (button) {
      const rect = button.getBoundingClientRect();
      const buttonY = rect.top + rect.height;

      if (buttonY > bottomButtonY) {
        bottomButton = button;
        bottomButtonY = buttonY;
      }
    });

    if (bottomButton) {
      const monthRoue = bottomButton.value;
      moisActuelList.value = monthRoue;
      localStorage.setItem('selectedMonth', monthRoue);
    }
  }

  activeButton = null;
  document.removeEventListener('mousemove', dragMove);
  document.removeEventListener('mouseup', dragEnd);
}


// affichage des cartes
let carteRetournee = false;
let carteAff;

cartes.forEach(carte => {
    carte.addEventListener('click', retourneCarte)
})

function retourneCarte(){
    this.childNodes[1].classList.toggle('active');
    if(!carteRetournee){
  carteRetournee = true;
        carteAff = this;
        return;
    }
  carteRetournee = false;  
}

document.addEventListener('DOMContentLoaded', function () {
  let index = 0;
  function afficherCartes() {
      if (index < cartes.length) {
          cartes[index].style.display = 'block'; 
          cartes[index].style.opacity = '1'; 
          index++;
          setTimeout(afficherCartes, 50); 
      }
  }
  
  afficherCartes();
});

function myAccount() {
  var liste = document.getElementById("compte");

  if (liste.style.display === "none" || liste.style.display === "") {
    liste.style.display = "block";
  } else {
    liste.style.display = "none";
  }
}

//clear localStorage
document.addEventListener('DOMContentLoaded', function() {
  var deleteLS = document.getElementById('InitialMonth');
  deleteLS.addEventListener('click', function(event) {
  event.preventDefault();
  localStorage.clear();
  window.location.href = "index.php";
  });
});








