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
//previsualiser une image editeur
function previewImage(event) {
  var reader = new FileReader();
  reader.onload = function() {
  var preview = document.getElementById('preview');
  preview.src = reader.result;
  };
  reader.readAsDataURL(event.target.files[0]);
}
