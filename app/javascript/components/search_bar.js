const initSearchBar = () => {
  // right sidebar
  let icon = document.querySelector(".search_icon")
  let search_bar = document.querySelector(".search_bar")
  let scaling_calendar = document.querySelector(".calendar");
  const scaled_sidebar = document.querySelector(".modif_manuelle")

  // // search bar user index
  // let input = document.querySelector("#my_search")
  // let search_bar_index = document.querySelector(".search_bar")

  // return if we are not on the shift index
  if (!icon)
    return

  icon.addEventListener("click", (event) => {
    scaled_sidebar.classList.toggle('active');
    search_bar.classList.toggle('active');
    scaling_calendar.classList.toggle('open')
  });
}

export default initSearchBar;
