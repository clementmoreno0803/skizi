import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';
import {MONTHLY_CUSTOM_THEME} from './templates';
import {templates} from './templates';
import CustomEvents from 'tui-code-snippet/customEvents/customEvents';

const calendar = new Calendar('#calendar-month', {
  defaultView: 'month',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  scheduleView: ['allday', 'time'],
  theme: MONTHLY_CUSTOM_THEME,
  template: {
    monthDayname: function (dayname) {
      return '<span class="calendar-month-dayname-name">' + dayname.label + '</span>';
    },
    templates
  }
});

const calendar2 = new Calendar('#calendar-day', {
  defaultView: 'day',
  taskView: ['task'],
  useCreationPopup: true,
  useDetailPopup: true,
  scheduleView: ['allday', 'time'],
  week:{
    hourStart: 18,
    hourEnd: 21
  },
  template: {
    Dayname: function (dayname) {
      return '<span class="calendar-dayname-name">' + dayname.label + '</span>';
    },
    templates
  }
});

calendar.createSchedules([
  {
    id: '1',
    calendarId: '1',
    title: 'my schedule',
    category: 'time',
    dueDateClass: '',
    start: '2021-08-25T22:30', // to _s
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

export {calendar2};
export {calendar};
