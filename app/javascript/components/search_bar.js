const initSearchBar = (Rails) => {
  // right sidebar
  const icon = document.querySelector(".search_icon")
  const search_bar = document.querySelector(".search_bar")
  const scaling_calendar = document.querySelector(".calendar");
  const text_field_shift = document.querySelector("#query")
  const text_field_user = document.querySelector("#name")
  const scaled_sidebar = document.querySelector(".modif_manuelle")
  const form = document.querySelector(".search_bar form")

  // return if we are not on the shift index
  if (icon) {
    icon.addEventListener("click", (event) => {
      scaled_sidebar.classList.toggle('active');
      search_bar.classList.toggle('active');
      scaling_calendar.classList.toggle('open')
    });

    text_field_shift.addEventListener("input", function (e) {
      Rails.fire(form, 'submit')
    })
  }

  if (text_field_user) {
    text_field_user.addEventListener("input", function (e) {
      Rails.fire(form, 'submit')
    })
  }
}

export default initSearchBar;
