
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

import "../components/sidebars";
import "../components/notifications";
import initSearchBar from "../components/search_bar";
import "../plugins/calendar";
import "../plugins/menu_calendar";
import "../components/alerts";
import initDrapEmployeeOnCalendar from "../plugins/drag_drop";
import initAlertOfWorkingTime from "../components/alerts";

document.addEventListener('turbolinks:load', () => {
  initSearchBar(Rails);
  initDrapEmployeeOnCalendar();
  initAlertOfWorkingTime();
});
