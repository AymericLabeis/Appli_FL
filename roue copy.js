const Roue = document.querySelector('.RoueSelect');
const buttonsRoue = document.querySelectorAll('.buttonR');
const storedMonth = localStorage.getItem('selectedMonth');
const moisActuel = storedMonth ? parseInt(storedMonth) : new Date().getMonth() + 1;
const moisActuelList= document.getElementById('mois');
var initialX = 0, angleRotation = 0;
var initialRotation = 180; 
var rotationIncrement = 30;

moisActuelList.value = (moisActuel < 10 ? '0' : '') + moisActuel;

function CurrentMonthRoue() {
    var currentMonthIndex = moisActuel;
    var currentButtonIndex = (-currentMonthIndex) % 12;
    var degrees = initialRotation + rotationIncrement * currentButtonIndex;
    Roue.style.transform = 'rotate(' + degrees + 'deg)';
    angleRotation = degrees;
  }
  CurrentMonthRoue();

  function rotateRoue(degrees) {
    angleRotation += degrees;
    Roue.style.transform = `rotate(${angleRotation}deg)`;
    if (degrees > 0) {
      moisActuelList.selectedIndex = (moisActuelList.selectedIndex - 1 +
         moisActuelList.length) % moisActuelList.length;
    } else {
      moisActuelList.selectedIndex = (moisActuelList.selectedIndex + 1 + 
        moisActuelList.length) % moisActuelList.length;
    }
    localStorage.setItem('selectedMonth', moisActuelList.value);
  }
  
  moisActuelList.addEventListener('change', function () {
    var selectedMonth = parseInt(moisActuelList.value);
    localStorage.setItem('selectedMonth', selectedMonth);
  });