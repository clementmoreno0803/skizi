import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';
import moment from "moment";
// fonction previous next today
// const next_month = document.getElementById("move-next-month");
// const next_day = document.getElementById("move-next-day");
// const prev_month = document.getElementById("move-prev-month");
// const prev_day = document.getElementById("move-prev-day");
// const current_month = document.getElementById("current-month");
// const current_day = document.getElementById("move-today");
// next_day.addEventListener("click", () => {
//   calendar2.next()
// });
// prev_day.addEventListener("click", () => {
//   calendar2.prev()
// });
// current_day.addEventListener("click", () => {
//   calendar2.today()
// });
// next_month.addEventListener("click", () => {
//   calendar.next()
// });
// prev_month.addEventListener("click", () => {
//   calendar.prev()
// });
// current_month.addEventListener("click", () => {
//   calendar.today()
// });
//___________________________________________________

const calendar = new Calendar('#calendar-month', {
  defaultView: 'month',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  template: {
    monthDayname: function (dayname) {
      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
    },
    onClickNavi:function(e) {
      var action = getDataAction(e.target);
      console.log(action)

      switch (action) {
        case 'move-prev':
          calendar.prev();
          break;
        case 'move-next':
          calendarr.next();
          break;
        case 'move-today':
          calendar.today();
          break;
        default:
          return;
      }

      setRenderRangeText();
      setSchedules();
    },
      setRenderRangeText:function() {
      var renderRange = document.getElementById('renderRange');
      var options = calendar.getOptions();
      var viewName = calendar.getViewName();

      var html = [];
      if(viewName === 'day') {
      html.push(currentCalendarDate('YYYY.MM.DD'));
      } else if (viewName === 'month' &&
      (!options.month.visibleWeeksCount || options.month.visibleWeeksCount > 4)) {
      html.push(currentCalendarDate('YYYY.MM'));
      } else {
      html.push(moment(calendar.getDateRangeStart().getTime()).format('YYYY.MM.DD'));
      html.push(' ~ ');
      html.push(moment(calendar.getDateRangeEnd().getTime()).format(' MM.DD'));
      }
      renderRange.innerHTML = html.join('');
      },
    popupIsAllDay: function () {
      return 'All Day';
    },
    popupStateFree: function () {
      return 'Free';
    },
    popupStateBusy: function () {
      return 'Busy';
    },
    titlePlaceholder: function () {
      return 'Subject';
    },
    locationPlaceholder: function () {
      return 'Location';
    },
    startDatePlaceholder: function () {
      return 'Start date';
    },
    endDatePlaceholder: function () {
      return 'End date';
    },
    popupSave: function () {
      return 'Save';
    },
    popupUpdate: function () {
      return 'Update';
    },
    popupDetailDate: function (isAllDay, start, end) {
      const isSameDate = moment(start).isSame(end);
      const endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

      if (isAllDay) {
        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
      }

      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
    },
    popupDetailLocation: function (schedule) {
      return 'Location : ' + schedule.location;
    },
    popupDetailUser: function (schedule) {
      return 'User : ' + (schedule.attendees || []).join(', ');
    },
    popupDetailState: function (schedule) {
      return 'State : ' + schedule.state || 'Busy';
    },
    popupDetailRepeat: function (schedule) {
      return 'Repeat : ' + schedule.recurrenceRule;
    },
    popupDetailBody: function (schedule) {
      return 'Body : ' + schedule.body;
    },
    popupEdit: function () {
      return 'Edit';
    },
    popupDelete: function () {
      return 'Delete';
    }
  }
});
const calendar2 = new Calendar('#calendar-day', {
  defaultView: 'day',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  scheduleView: true,
  template: {
    Dayname: function (dayname) {
      return '<span class="calendar-dayname-name">' + dayname.label + '</span>';
    },
    popupIsAllDay: function () {
      return 'All Day';
    },
    popupStateFree: function () {
      return 'Free';
    },
    popupStateBusy: function () {
      return 'Busy';
    },
    titlePlaceholder: function () {
      return 'Subject';
    },
    locationPlaceholder: function () {
      return 'Location';
    },
    startDatePlaceholder: function () {
      return 'Start date';
    },
    endDatePlaceholder: function () {
      return 'End date';
    },
    popupSave: function () {
      return 'Save';
    },
    popupUpdate: function () {
      return 'Update';
    },
    popupDetailDate: function (isAllDay, start, end) {
      const isSameDate = moment(start).isSame(end);
      const endFormat = (isSameDate ? '' : 'YYYY.MM.DD ') + 'hh:mm a';

      if (isAllDay) {
        return moment(start).format('YYYY.MM.DD') + (isSameDate ? '' : ' - ' + moment(end).format('YYYY.MM.DD'));
      }

      return (moment(start).format('YYYY.MM.DD hh:mm a') + ' - ' + moment(end).format(endFormat));
    },
    popupDetailLocation: function (schedule) {
      return 'Location : ' + schedule.location;
    },
    popupDetailUser: function (schedule) {
      return 'User : ' + (schedule.attendees || []).join(', ');
    },
    popupDetailState: function (schedule) {
      return 'State : ' + schedule.state || 'Busy';
    },
    popupDetailRepeat: function (schedule) {
      return 'Repeat : ' + schedule.recurrenceRule;
    },
    popupDetailBody: function (schedule) {
      return 'Body : ' + schedule.body;
    },
    popupEdit: function () {
      return 'Edit';
    },
    popupDelete: function () {
      return 'Delete';
    },
  }
});

calendar.createSchedules([
  {
    id: '1',
    calendarId: '1',
    title: 'my schedule',
    category: 'time',
    dueDateClass: '',
    start: '2021-08-25T22:30',
    end: '2021-08-25T23:30'
  },
  {
    id: '2',
    calendarId: '2',
    title: 'second schedule',
    category: 'time',
    dueDateClass: '',
    start: '2021-08-25T17:30',
    end: '2021-08-25T22:31'
  }
]);

calendar2.createSchedules([
  {
    id: '1',
    calendarId: '1',
    title: 'my schedule',
    category: 'time',
    dueDateClass: '',
    start: '2021-08-25T22:30',
    end: '2021-08-25T23:30'
  },
  {
    id: '2',
    calendarId: '2',
    title: 'second schedule',
    category: 'time',
    dueDateClass: '',
    start: '2021-08-25T17:30',
    end: '2021-08-25T22:31'
  }
]);
