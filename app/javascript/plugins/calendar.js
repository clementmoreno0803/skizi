// import Calendar from 'tui-calendar';
// import "tui-calendar/dist/tui-calendar.css";
// import 'tui-date-picker/dist/tui-date-picker.css';
// import 'tui-time-picker/dist/tui-time-picker.css';
// import {MONTHLY_CUSTOM_THEME } from './templates';
// import {templates} from './templates';


// const calendar = new Calendar('#calendar-month', {
//   defaultView: 'month',
//   useCreationPopup: true,
//   useDetailPopup: true,
//   scheduleView: ['time'],
//   theme: MONTHLY_CUSTOM_THEME,
//   template: {
//     monthDayname: function (dayname) {
//       return '<span class="calendar-month-dayname-name">' + dayname.label + '</span>';
//     },
//     templates
//   }
// });

// const calendar2 = new Calendar('#calendar-day', {
//   defaultView: 'day',
//   taskView: ['task'],
//   useCreationPopup: true,
//   useDetailPopup: true,
//   scheduleView: ['time'],
//   week:{
//     hourStart: 9,
//     hourEnd: 22
//   },
//   template: {
//     Dayname: function (dayname) {
//       return '<span class="calendar-dayname-name">' + dayname.label + '</span>';
//     },
//     templates
//   }
// });
// function RandomColor() {
//   var letters = '0123456789ABCDEF';
//   var color = '#';
//   for (var i = 0; i < 6; i++) {
//     color += letters[Math.floor(Math.random() * 16)];
//   }
//   return color;
// }

// // entries calendar
// //   const call = document.getElementById("calendar-month")
// //   const user_shifts = JSON.parse(call.dataset.user_shifts);
// //   user_shifts.forEach((i) => {
// //     calendar.createSchedules([
// //       {
// //         id: `${i.id}`,
// //         calendarId: '1',
// //         title: `${i.title}`,
// //         category: 'time',
// //         dueDateClass: '',
// //         start: `${i.start}`,
// //         end: `${i.end}`,
// //         bgColor: RandomColor
// //       },
// //     ])
// //   });

// // user_shifts.forEach((i) => {
// //   // console.log(i.id.string), console.log(i.title), console.log(i.job), console.log(i.start), console.log(i.end), console.log('1')
// //   calendar2.createSchedules([
// //     {
// //       id: i.id,
// //       calendarId: '1',
// //       title: i.title,
// //       category: 'time',
// //       dueDateClass: '',
// //       start: `${i.start}`,
// //       end: `${i.end}`,
// //       bgColor: RandomColor
// //     }
// //   ])
// // });

// export {calendar2}
// export {calendar}
