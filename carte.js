const cartes = document.querySelectorAll('.carte');

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