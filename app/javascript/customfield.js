document.addEventListener("DOMContentLoaded", function() {
  var select = document.querySelector('#label_id_select');
  var newOption = document.createElement("option");
  newOption.value = "new";
  newOption.text = "Create a new one";

  select.appendChild(newOption);
  select.insertBefore(newOption, select.lastChild.nextSibling);


  var select = document.querySelector('#label_id_select');
  var newLabelDiv = document.querySelector('#new_label');

  // Add change event listener to the select element
  select.addEventListener('change', function() {
    if (select.value === 'new') {
      newLabelDiv.style.display = 'block'; // Show the div for new label
    } else {
      newLabelDiv.style.display = 'none';  // Hide the div for new label
    }
  });
});
