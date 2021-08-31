// Entries Calendar ..
const call = document.getElementById("calendar")
const user_shifts = JSON.parse(call.dataset.user_shifts);
const job = []
user_shifts.forEach((i) => {
  job.push(
    {
      title: `${i.title}`,
      start: `${i.start}`,
      end: `${i.end}`
    })
});

export {job}
