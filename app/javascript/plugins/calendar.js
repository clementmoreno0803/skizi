
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';

const JobColors = {
  runner: '#036375',
  barman: '#F46036',
  padder: '#947EB0'
}

const shiftToEvent = (shit) => {
  return {
    title: `${shit.title}`,
    start: `${shit.start}`,
    end: `${shit.end}`,
    color: `${JobColors[shit.job]}`,
    resourceEditable: true,
  }
}

const jobs = () => {
  const call = document.getElementById("calendar")
  const user_shifts = JSON.parse(call.dataset.user_shifts);
  return user_shifts.map(shiftToEvent);
}

const initCalendar = () => {
  let calendarEl = document.getElementById('calendar');
  const containerEl = document.getElementById('thumbnail_dragdrop');

  if (!calendarEl)
    return

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
    events: jobs(),
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

}
;

export default initCalendar;
