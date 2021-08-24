document.addEventListener('turbolinks:load', () => {
  console.log(42)

  let sidebar = document.querySelector(".sidebar");

  sidebar.addEventListener("mouseenter", (e) => {
    sidebar.classList.toggle("close")
  });
  sidebar.addEventListener("mouseleave", (e) => {
    sidebar.classList.toggle("close")
  });


  let modif = document.querySelector(".foo");
  let sidebar_modif = document.querySelector(".modif_manuelle");

  modif.addEventListener("click", (e) => {
    e.preventDefault();
    sidebar_modif.classList.toggle("open")
  })
});
