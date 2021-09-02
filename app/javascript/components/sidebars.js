document.addEventListener('turbolinks:load', () => {

  let sidebar = document.querySelector(".sidebar");
  let navbar = document.querySelector(".home_content")
  let logo = document.querySelector("#logo_main")

  sidebar.addEventListener("mouseenter", (e) => {
    sidebar.classList.toggle("close")
    navbar.classList.toggle("open")
    logo.classList.toggle("open")
  });
  sidebar.addEventListener("mouseleave", (e) => {
    sidebar.classList.toggle("close")
    navbar.classList.toggle("open")
    logo.classList.toggle("open")
  });


  let modif = document.querySelector("#modif_sidebar");
  let scaling_calendar = document.querySelector(".calendar");
  let sidebar_modif = document.querySelector(".modif_manuelle");

  modif.addEventListener("click", (e) => {
    e.preventDefault();
    sidebar_modif.classList.toggle("open")
    // scaling_calendar.classList.toggle("active")
  });
});
