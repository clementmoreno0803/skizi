
function dragstart_handler(ev) {
  ev.dataTransfer.setData("application/my-app", ev.target.id);
  ev.dataTransfer.dropEffect = "move";
}
function dragover_handler(ev) {
  ev.preventDefault();
  ev.dataTransfer.dropEffect = "move"
}
function drop_handler(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("application/my-app");
  ev.target.appendChild(document.getElementById(data));
}
