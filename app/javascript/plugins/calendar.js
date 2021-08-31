
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';
import {job} from "../plugins/events";

document.addEventListener('DOMContentLoaded', function () {
  const calendarEl = document.getElementById('calendar');
  let draggableEl = document.getElementById('mydraggable');



  const calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
    initialView: 'dayGridMonth',
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    events:job
  });
  droppable: true
  editable: true
  calendar.render()
  new Draggable(draggableEl);
});
