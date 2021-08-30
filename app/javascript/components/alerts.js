const almost_finish = document.querySelector('#almost');
const finish = document.querySelector('#danger');
const display_none = document.querySelector('#danger');

let alerts = function (num1, num2) {
  if (num1 >= 0.75 * num2 && num1 < 0.9 * num2) {
   almost_finish.style.display = block;
  }
  else if (num1 > 0.9 * num2){
    finish.style.display = block;
  }
  else {

  }
}
