
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
import initSearchBar from "../components/search_bar";
import initCalendar from "../plugins/calendar";
import initDrapEmployeeOnCalendar from "../plugins/drag_drop";
// import initAlertOfWorkingTime from "../components/alerts";
import InitSwitchingForm from "../components/switching_form"
import InitiNotifications from "../components/notifications"

document.addEventListener('turbolinks:load', () => {
  initSearchBar(Rails);
  initDrapEmployeeOnCalendar();
  InitSwitchingForm();
  InitiNotifications();
  // initAlertOfWorkingTime();
  initCalendar();
});
