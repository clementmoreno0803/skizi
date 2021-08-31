// Entries Calendar ..
const call = document.getElementById("calendar")

const user_shifts = JSON.parse(call.dataset.user_shifts);
const jobs = []
user_shifts.forEach((i) => {
  jobs.push(
    {
      title: `${i.title}`,
      start: `${i.start}`,
      end: `${i.end}`,
      color: `${testJob(i.job)}`,
      resourceEditable:true,
    })
  });
  function testJob(a) {
    let result;
    if (a == 'runner') {
     return result = '#036375';
    };
    if (a == 'barman') {
      return result = '#F46036';
    };
    if (a == 'padder') {
      return result = '#947EB0';
    };
  };

  export {jobs}
