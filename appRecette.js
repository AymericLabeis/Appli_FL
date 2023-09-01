document.addEventListener('DOMContentLoaded', function() {
  localStorage.clear();
});
function afficherRecetteA(element) {
  var show = element.querySelector('.recetteA');
  if (show.style.display === 'block') {
    show.style.display = 'none'; 
  } else {
    show.style.display = 'block'; 
  }
  show.focus();
}

