const Roue = document.querySelector('.RoueSelect');
const buttonsRoue = document.querySelectorAll('.buttonR');
const storedMonth = localStorage.getItem('selectedMonth');
const moisActuel = storedMonth ? parseInt(storedMonth) : new Date().getMonth() + 1;
const moisActuelList= document.getElementById('mois');
var initialX = 0, angleRotation = 0;
var initialRotation = 180; 
var rotationIncrement = 30;

// Mettre à jour la liste déroulante avec le mois actuel
moisActuelList.value = (moisActuel < 10 ? '0' : '') + moisActuel;

// Position de la roue automatique en fonction du mois actuel
function CurrentMonthRoue() {
    var currentMonthIndex = moisActuel;
    var currentButtonIndex = (-currentMonthIndex) % 12;
    
    // Calcul l'angle de rotation pour placer le bouton en bas
    var degrees = initialRotation + rotationIncrement * currentButtonIndex;
    Roue.style.transform = 'rotate(' + degrees + 'deg)';
    angleRotation = degrees;
    console.log('rotation roue', angleRotation);
  }
  CurrentMonthRoue();

  function rotateRoue(degrees) {
    angleRotation += degrees;
    Roue.style.transform = `rotate(${angleRotation}deg)`;
    // Augmenter ou diminuer la valeur de l'index de la liste déroulante d'une unité
    if (degrees > 0) {
      moisActuelList.selectedIndex = (moisActuelList.selectedIndex - 1 + moisActuelList.length) % moisActuelList.length;
    } else {
      moisActuelList.selectedIndex = (moisActuelList.selectedIndex + 1 + moisActuelList.length) % moisActuelList.length;
    }
    // Stocker la valeur sélectionnée dans le Local Storage
    localStorage.setItem('selectedMonth', moisActuelList.value);
  }
  
  // Détecter l'envoi du formulaire et stocker le mois sélectionné dans le Local Storage
  moisActuelList.addEventListener('change', function () {
    var selectedMonth = parseInt(moisActuelList.value);
    localStorage.setItem('selectedMonth', selectedMonth);
  });