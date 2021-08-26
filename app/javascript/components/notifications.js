document.addEventListener('turbolinks:load', () => {
let notif = document.querySelector(".bx-message-alt");
let notif_dropdown = document.querySelector(".asking_modifications")

notif.addEventListener('click',() =>{
  notif_dropdown.classList.toggle('open')
})
});
