
import {calendar2} from "../plugins/calendar"
import {calendar} from "../plugins/calendar"

// // fonction previous next today
document.addEventListener('turbolinks:load', () => {
const next_month = document.getElementById("move-next-month");
const next_day = document.getElementById("move-next-day");
const prev_month = document.getElementById("move-prev-month");
const prev_day = document.getElementById("move-prev-day");
const current_month = document.getElementById("current-month");
const current_day = document.getElementById("current-day");
next_day.addEventListener("click", () => {
  calendar2.next()
});
prev_day.addEventListener("click", () => {
  calendar2.prev()
});
current_day.addEventListener("click", () => {
  calendar2.today()
});
next_month.addEventListener("click", () => {
  calendar.next()
});
prev_month.addEventListener("click", () => {
  calendar.prev()
});
current_month.addEventListener("click", () => {
  calendar.today()
});
});
// //___________________________________________________
