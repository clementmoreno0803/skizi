document.addEventListener('turbolinks:load', () => {

  let icon = document.querySelector(".search_icon")
  let search_bar = document.querySelector(".search_bar")
  let scaling_calendar = document.querySelector(".calendar");
const scaled_sidebar = document.querySelector(".modif_manuelle")
console.log(scaled_sidebar)

icon.addEventListener("click", (event) => {
  scaled_sidebar.classList.toggle('active');
  search_bar.classList.toggle('active');
  scaling_calendar.classList.toggle('open')
});
});

document.addEventListener('turbolinks:load', () => {

  let input = document.querySelector("#my_search_index")
  let search_bar_index = document.querySelector(".search_bar")

  input.addEventListener("click", () =>{
    search_bar_index.classList.toggle('active')
  })
});
