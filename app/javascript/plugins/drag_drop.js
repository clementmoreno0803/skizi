import Sortable from 'sortablejs';


const initDrapEmployeeOnCalendar = () => {
  const list_employees = document.querySelector('.thumbnail_dragdrop');
  const test = document.getElementById('test');

  if (list_employees && test){
    new Sortable(list_employees, {
      group: {
        name: 'shared',
        pull: 'clone' // To clone: set pull to 'clone'
      },
      animation: 150
    });

    new Sortable(test, {
      group: {
        name: 'shared',
        pull: 'clone'
      },
      animation: 150
    });

    setTimeout(() => {
      console.log(document.querySelectorAll('.tui-full-calendar-weekday-grid-line'))
    }, 3000);
  }
}

export default initDrapEmployeeOnCalendar;
