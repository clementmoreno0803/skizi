const templates_month = {
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
  milestone: function(schedule) {
    return getGridCategoryTemplate('milestone', schedule);
  },
  milestoneTitle: function() {
    return getGridTitleTemplate('milestone');
  },
  task: function(schedule) {
    return getGridCategoryTemplate('task', schedule);
  },
  taskTitle: function() {
    return getGridTitleTemplate('task');
  },
  allday: function(schedule) {
    return getTimeTemplate(schedule, true);
  },
  alldayTitle: function() {
    return getGridTitleTemplate('allday');
  },
  time: function(schedule) {
    return getTimeTemplate(schedule, false);
  },
  goingDuration: function(schedule) {
    return '<span class="calendar-icon ic-travel-time"></span>' + schedule.goingDuration + 'min.';
  },
  comingDuration: function(schedule) {
    return '<span class="calendar-icon ic-travel-time"></span>' + schedule.comingDuration + 'min.';
  },
  monthMoreTitleDate: function(date, dayname) {
    const day = date.split('.')[2];
    return '<span class="tui-full-calendar-month-more-title-day">' + day + '</span> <span class="tui-full-calendar-month-more-title-day-label">' + dayname + '</span>';
  },
  monthMoreClose: function() {
    return '<span class="tui-full-calendar-icon tui-full-calendar-ic-close"></span>';
  },
  monthGridHeader: function(dayModel) {
    const date = parseInt(dayModel.date.split('-')[2], 10);
    const classNames = ['tui-full-calendar-weekday-grid-date '];

    if (dayModel.isToday) {
      classNames.push('tui-full-calendar-weekday-grid-date-decorator');
    }

    return '<span class="' + classNames.join(' ') + '">' + date + '</span>';
  },
  monthGridHeaderExceed: function(hiddenSchedules) {
    return '<span class="weekday-grid-more-schedules">+' + hiddenSchedules + '</span>';
  },
  monthGridFooter: function() {
    return '';
  },
  monthGridFooterExceed: function(hiddenSchedules) {
    return '';
  },
  monthDayname: function(model) {
    return String(model.label).toLocaleUpperCase();
  },
  dayGridTitle: function(viewName) {
    /*
     * use another functions instead of 'dayGridTitle'
     * milestoneTitle: function() {...}
     * taskTitle: function() {...}
     * alldayTitle: function() {...}
    */

    return getGridTitleTemplate(viewName);
  },
  schedule: function(schedule) {
    /*
     * use another functions instead of 'schedule'
     * milestone: function() {...}
     * task: function() {...}
     * allday: function() {...}
    */

    return getGridCategoryTemplate(schedule.category, schedule);
  }
};

const MONTHLY_CUSTOM_THEME = {
  // month header 'dayname'
  'month.dayname.height': '42px',
  'month.dayname.borderLeft': 'none',
  'month.dayname.paddingLeft': '8px',
  'month.dayname.paddingRight': '0',
  'month.dayname.fontSize': '13px',
  'month.dayname.backgroundColor': 'inherit',
  'month.dayname.fontWeight': 'normal',
  'month.dayname.textAlign': 'left',

  // month day grid cell 'day'
  'month.holidayExceptThisMonth.color': '#f3acac',
  'month.dayExceptThisMonth.color': '#bbb',
  'month.weekend.backgroundColor': '#fafafa',
  'month.day.fontSize': '16px',

  // month schedule style
  'month.schedule.borderRadius': '5px',
  'month.schedule.height': '18px',
  'month.schedule.marginTop': '2px',
  'month.schedule.marginLeft': '10px',
  'month.schedule.marginRight': '10px',

  // month more view
  'month.moreView.boxShadow': 'none',
  'month.moreView.paddingBottom': '0',
  'month.moreView.border': '1px solid #9a935a',
  'month.moreView.backgroundColor': '#f9f3c6',
  'month.moreViewTitle.height': '28px',
  'month.moreViewTitle.marginBottom': '0',
  'month.moreViewTitle.backgroundColor': '#f4f4f4',
  'month.moreViewTitle.borderBottom': '1px solid #ddd',
  'month.moreViewTitle.padding': '0 10px',
  'month.moreViewList.padding': '10px'
};

function getTimeTemplate(schedule, isAllDay) {
  const html = [];

  if (!isAllDay) {
    html.push('<strong>' + moment(schedule.start.getTime()).format('HH:mm') + '</strong> ');
  }
  if (schedule.isPrivate) {
    html.push('<span class="calendar-font-icon ic-lock-b"></span>');
    html.push(' Private');
  } else {
    if (schedule.isReadOnly) {
      html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
    } else if (schedule.recurrenceRule) {
      html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
    } else if (schedule.attendees.length) {
      html.push('<span class="calendar-font-icon ic-user-b"></span>');
    } else if (schedule.location) {
      html.push('<span class="calendar-font-icon ic-location-b"></span>');
    }
    html.push(' ' + schedule.title);
  }

  return html.join('');
}

function getGridTitleTemplate(type) {
  const title = '';

  switch (type) {
    case 'milestone':
      title = '<span class="tui-full-calendar-left-content">MILESTONE</span>';
      break;
    case 'task':
      title = '<span class="tui-full-calendar-left-content">TASK</span>';
      break;
    case 'allday':
      title = '<span class="tui-full-calendar-left-content">ALL DAY</span>';
      break;
  }

  return title;
}

function getGridCategoryTemplate(category, schedule) {
  const tpl;

  switch (category) {
    case 'milestone':
      tpl = '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + schedule.bgColor + '">' + schedule.title + '</span>';
      break;
    case 'task':
      tpl = '#' + schedule.title;
      break;
    case 'allday':
      tpl = getTimeTemplate(schedule, true);
      break;
  }

  return tpl;
}
function getPadStart(value) {
    value = value.toString();

    return padStart.call(value, 2, '0');
  }

  // register templates
  const templates = {
    weekDayname: function(model) {
      return '<span class="tui-full-calendar-dayname-date">' + model.date + '</span>&nbsp;&nbsp;<span class="tui-full-calendar-dayname-name">' + model.dayName + '</span>';
    },
    weekGridFooterExceed: function(hiddenSchedules) {
      return '+' + hiddenSchedules;
    },
    dayGridTitle: function(viewName) {
      /*
       * use another functions instead of 'dayGridTitle'
       * milestoneTitle: function() {...}
       * taskTitle: function() {...}
       * alldayTitle: function() {...}
      */

      return getGridTitleTemplate(viewName);
    },
    schedule: function(schedule) {
      /*
       * use another functions instead of 'schedule'
       * milestone: function() {...}
       * task: function() {...}
       * allday: function() {...}
      */

      return getGridCategoryTemplate(schedule.category, schedule);
    },
    collapseBtnTitle: function() { // ??? 어떤 템플릿인가요??
      return '<span class="tui-full-calendar-icon tui-full-calendar-ic-arrow-solid-top"></span>';
    },
    timezoneDisplayLabel: function(timezoneOffset, displayLabel) {
      const gmt, hour, minutes;

      if (!displayLabel) {
        gmt = timezoneOffset < 0 ? '-' : '+';
        hour = Math.abs(parseInt(timezoneOffset / 60, 10));
        minutes = Math.abs(timezoneOffset % 60);
        displayLabel = gmt + getPadStart(hour) + ':' + getPadStart(minutes);
      }
      return displayLabel;
    },
    timegridDisplayPrimayTime: function(time) {
      /* will be deprecated. use 'timegridDisplayPrimaryTime' */
      const hour = time.hour;
      const meridiem = hour >= 12 ? 'pm' : 'am';

      if (hour > 12) {
        hour = hour - 12;
      }

      return hour + ' ' + meridiem;
    },
    timegridDisplayPrimaryTime: function(time) {
      const hour = time.hour;
      const meridiem = hour >= 12 ? 'pm' : 'am';

      if (hour > 12) {
        hour = hour - 12;
      }

      return hour + ' ' + meridiem;
    },
    timegridDisplayTime: function(time) {
      return getPadStart(time.hour) + ':' + getPadStart(time.hour);
    },
    timegridCurrentTime: function(timezone) {
      const templates = [];

      if (!timezone) {
          return '';
      }

      if (timezone.dateDifference !== 0) {
          templates.push('[' + timezone.dateDifferenceSign + timezone.dateDifference + ']<br>');
      }

      templates.push(moment(timezone.hourmarker.toUTCString()).format('HH:mm'));
      return templates.join('');
    }
  };
export {MONTHLY_CUSTOM_THEME}
export {templates_month}
export {templates_week}
export {templates}
