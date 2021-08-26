import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';

const calendar = new Calendar('#calendar-month', {
  defaultView: 'month',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  template: {
    monthDayname: function (dayname) {
      return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
    }
  }
});

const calendar2 = new Calendar('#calendar-day', {
  defaultView: 'day',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  template: {
    Dayname: function (dayname) {
      return '<span class="calendar-dayname-name">' + dayname.label + '</span>';
    }
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
