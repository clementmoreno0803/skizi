const InitSwitchingForm = () => {
  const boutton = document.querySelector('.sliding_button')
  const card = document.querySelector('.flipping_card');

  if (boutton){
    boutton.addEventListener('click', function () {
      card.classList.toggle('is-flipped');
      boutton.style.display = 'none'

    });
    const arrowToGoBackward = document.querySelector('.bx-left-arrow-alt')

    arrowToGoBackward.addEventListener('click', function () {
      card.classList.toggle('is-flipped');
      boutton.style.display = 'block'
    });
  }

}

export default InitSwitchingForm
