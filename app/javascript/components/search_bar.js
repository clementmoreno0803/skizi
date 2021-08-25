let icon = document.querySelector(".search_icon")
let search_bar = document.querySelector(".search_bar")
let scaled_sidebar = document.querySelector(".modif_manuelle")
console.log(scaled_sidebar)

icon.addEventListener("click", (event) => {
  scaled_sidebar.classList.toggle('active');
  search_bar.classList.toggle('active');
});
