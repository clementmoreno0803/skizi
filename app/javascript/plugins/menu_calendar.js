
import {calendar2} from "./_calendar"
import {calendar} from "./_calendar"

// // fonction previous next today
const next_month = document.getElementById("right_arrow_month");
const next_day = document.getElementById("right_arrow_day");
const prev_month = document.getElementById("left_arrow_month");
  const prev_day = document.getElementById("left_arrow_day");

next_month.addEventListener("click", () => {
  calendar.next()
});
next_day.addEventListener("click", () => {
  calendar2.next()
});
prev_month.addEventListener("click", () => {
  calendar.prev()
});
prev_day.addEventListener("click", () => {
  calendar2.prev()
});
// //___________________________________________________
