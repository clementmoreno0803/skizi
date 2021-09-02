
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';

let calendar;

const addShiftToCalendar = (shift) => {
  const event = shiftToEvent(shift)
  calendar.addEvent(event)
}

const selectInterval = (info) => {
  createShift(info.startStr, info.endStr)
}

const updateUserShift = (id, start, end) => {
  fetch(`/user_shifts/${id}`, {
    method: "PATCH",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ start: start, end: end})
  })
}

const createShift = (start, end) => {
  console.log(start),
    console.log(end);
  console.log('coucou')
  fetch(`/shifts`, {
    method: "POST",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      start: start,
      end: end
    })
    }).then(response => response.json())
      .then(addShiftToCalendar)
}

const JobColors = {
  runner: '#036375',
  barman: '#F46036',
  padder: '#947EB0'
}

const userShiftToEvent = (userShift) => {
  return {
    id: `${userShift.id}`,
    title: `${userShift.title}`,
    start: `${userShift.start}`,
    end: `${userShift.end}`,
    color: `${JobColors[userShift.job]}`,
    resourceEditable: true,
  }
}
const shiftToEvent = (shift) => {
  return {
    id: `${shift.id}`,
    start: `${shift.started_at}`,
    end: `${shift.ended_at}`,
    display: 'background',
    color: 'red'
  }
}

const events = () => {
  const call = document.getElementById("calendar")
  const user_shifts = JSON.parse(call.dataset.user_shifts);
  const shifts = JSON.parse(call.dataset.shifts);

  const eventUserShifts = user_shifts.map(userShiftToEvent)
  const eventShifts = shifts.map(shiftToEvent)

  return (eventUserShifts.concat(eventShifts));
}

const eventDrop = (info) => {
  updateUserShift(info.event.id, info.event.start, info.event.end)

  // alert(info.event.title + " was dropped on " + info.event.start.toISOString());

  // if (!confirm("Are you sure about this change?")) {
  //   info.revert();
  // }
}


const initDragAndDrop = () => {
  const containerEl = document.getElementById('thumbnail_dragdrop');

  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: (eventEl) => {
      return {
        title: eventEl.innerText,
      };
    }
  });

  calendar.render()
}

window.initDragAndDrop = initDragAndDrop;

const initCalendar = () => {
  let calendarEl = document.getElementById('calendar');

  if (!calendarEl)
    return

  calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
    droppable: true,
    editable: true,
    dayMaxEventRows: true,
    navLinks: true,
    eventStartEditable:true,
    eventDurationEditable:true,
    initialView: 'dayGridMonth',
    eventDrop: eventDrop,
    selectable: true,
    select: selectInterval,
    views: {
      timeGrid: {
        dayMaxEventRows: 6
      }
    },
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'addEventButton dayGridMonth,timeGridWeek,listWeek'
    },
    customButtons: {
      addEventButton: {
        text: 'add shift',
        click: function () {
          const dateStr = prompt('Enter a date in YYYY-MM-DD format');
          const starthour = prompt('Enter a start hour HH:MM:SS format');
          const start = new Date(dateStr + `T${starthour}`);
          const endhour = prompt('Enter a end hour HH: MM: SS format');
          const end = new Date(dateStr + `T${endhour}`);

          console.log(`${start}`)
          console.log(`${end}`)
          if (!isNaN(start.valueOf())) {
            createShift(
              start,
              end,
            );
            alert('Great. Now, update your database...');
          } else {
            alert('Invalid date.');
          }
        }
      }
    },
    events: events(),
    navLinkDayClick: function (date, jsEvent) {
      console.log('day', date.toISOString());
      console.log('coords', jsEvent.pageX, jsEvent.pageY);
    },
  });

  initDragAndDrop();
}
;

export default initCalendar;
