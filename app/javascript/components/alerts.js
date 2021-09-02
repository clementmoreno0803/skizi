
const initAlertOfWorkingTime = () => {
  const almost_finish = document.querySelector('.almost');
  const finish = document.querySelector('.danger');

  if (!almost_finish)
    return

    const alerts = function (num1, num2) {
      if (num1 >= 0.75 * num2 && num1 < 0.9 * num2) {
        almost_finish.style.display = "block";
        finish.style.display = "none";
        console.log(almost_finish)
      }
      else if (num1 >= 0.9 * num2){
        finish.style.display = "block";
        almost_finish.style.display = "none";
        console.log(finish)
      }
      else {
        almost_finish.style.display = "none";
        finish.style.display = "none";
      }
    }
    alerts(20,25)
}

export default initAlertOfWorkingTime
