
import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin, { Draggable } from '@fullcalendar/interaction';

let calendar;

const initDragAndDrop = () => {
  const containerEl = document.getElementById('thumbnail_dragdrop');

  new Draggable(containerEl, {
    itemSelector: '.fc-event',
    eventData: function (eventEl) {
      return {
        title: eventEl.innerText.toUpperCase(),
        duration: '00:30'
      };
    }
  });
}
window.initDragAndDrop = initDragAndDrop;


const addShiftToCalendar = (shift) => {
  const event = shiftToEvent(shift)
  calendar.addEvent(event)
}

const selectInterval = (info) => {
  createShift(info.startStr, info.endStr)
}

const updateUserShift = (id, start, end, callback) => {
  fetch(`/user_shifts/${id}`, {
    method: "PATCH",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ start: start, end: end, })
  }).then(response => response.json())
  .then(callback)
}

const createUserShift = (userId, start, end, callback) => {
  fetch(`/user_shifts`, {
    method: "POST",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      user_id: userId,
      start: start,
      end: end
    })
  }).then(response => response.json())
  .then(callback)
}

const deleteUserShift = (id, start, end, callback) => {
  fetch(`/user_shifts/${id}`, {
    method: "DELETE",
    headers: {
      "X-CSRF-Token": document.querySelector("[name='csrf-token']").content,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ start: start, end: end, })
  }).then(response => response.json())
  .then(callback)
}
const createShift = (start, end) => {

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
    color: 'pink'
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
  const start = info.event.start
  start.setMinutes(start.getMinutes() + 30)
  info.event.setEnd(start)

  updateUserShift(info.event.id, info.event.start, info.event.end, (userShift) => {
    info.event.setStart(userShift.shift.started_at)
    info.event.setEnd(userShift.shift.ended_at)
    calendar.render()
  })
}

const eventReceive = (addInfo) => {
  const start = addInfo.event.start
  const end = addInfo.event.end
  const userId = addInfo.draggedEl.dataset.userId

  createUserShift(userId, start, end, (userShift) => {
    addInfo.event.setStart(userShift.shift.started_at)
    addInfo.event.setEnd(userShift.shift.ended_at)
    addInfo.event.setProp("id", userShift.id)
    calendar.render()
  })
}


const initCalendar = () => {
  let calendarEl = document.getElementById('calendar');
  const containerEl = document.getElementById('thumbnail_dragdrop');

  if (!calendarEl)
  return

  calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin],
    hiddenDays: [0],
    droppable: true,
    editable: true,
    dayMaxEventRows: true,
    navLinks: true,
    eventStartEditable: true,
    eventDurationEditable: true,
    initialView: 'dayGridMonth',
    eventReceive: eventReceive,
    eventDrop: eventDrop,
    selectable: true,
    select: selectInterval,
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,listWeek'
    },
    events: events(),
    eventClick: onclick = (info) => {
        info.jsEvent.preventDefault();
        const event = calendar.getEventById(info.event.id);
      if (confirm("Are you sure to remove " + info.event.title + " ?" )){
          event.remove();
          deleteUserShift(info.event.id)
      }
    },
  });
  initDragAndDrop();

  calendar.render()

}
;
export default initCalendar;
