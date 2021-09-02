
const InitiNotifications = () => {
  // open dropdown on click
  const notif = document.querySelector(".bxs-message-alt");
  const notif_dropdown = document.querySelector(".asking_modifications")

  notif.addEventListener('click',() =>{
    notif_dropdown.classList.toggle('open')
  })

  // closing dropdown on click
  const closing = document.querySelector('.bouton_validation')
  const emptyNotificationButton = document.querySelector('.bx-message-alt')

  closing.addEventListener('click', () => {
    notif_dropdown.style.display = 'none';
    notif.style.display = 'none';
    emptyNotificationButton.style.display = 'block';
  })
};

export default InitiNotifications
