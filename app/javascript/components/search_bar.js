const initSearchBar = (Rails) => {
  // right sidebar
  const icon = document.querySelector(".search_icon")
  const search_bar = document.querySelector(".search_bar")
  const scaling_calendar = document.querySelector(".calendar");
  const text_field = document.querySelector("#query")
  const scaled_sidebar = document.querySelector(".modif_manuelle")
  const form = document.querySelector(".search_bar form")

  // // search bar user index
  // let search_bar_index = document.querySelector(".search_bar")

  // return if we are not on the shift index
  if (!icon)
    return

  icon.addEventListener("click", (event) => {
    scaled_sidebar.classList.toggle('active');
    search_bar.classList.toggle('active');
    scaling_calendar.classList.toggle('open')
  });

  text_field.addEventListener("input", function(e) {
    Rails.fire(form, 'submit')
  })
}

export default initSearchBar;
