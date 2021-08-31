import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';
import {jobs} from "../plugins/events";

let calendarEl = document.getElementById('calendar');
const containerEl = document.getElementById('thumbnail_dragdrop');

document.addEventListener('DOMContentLoaded', function () {
  const calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
    droppable: true,
    editable: true,
    dayMaxEventRows: true,
    navLinks: true,
    eventStartEditable:true,
    eventDurationEditable:true,
    businessHours:true,
    initialView: 'dayGridMonth',
    views: {
      timeGrid: {
        dayMaxEventRows: 6
      }
    },
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    events:jobs,
    businessHours: {
      startTime: '18:00',
      endTime: '21:00',
    },
    navLinkDayClick: function (date, jsEvent) {
      console.log('day', date.toISOString());
      console.log('coords', jsEvent.pageX, jsEvent.pageY);
    },
  });

  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: function (eventEl) {
      return {
        title: eventEl.innerText.toUpperCase(),
      };
    }
  });

  calendar.render()

});
