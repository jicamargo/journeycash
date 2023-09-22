document.addEventListener('DOMContentLoaded', function() {

  /* verify if the user is in the edit group window */
  const editGroupWindow = document.querySelector('.icon-label');
  if (editGroupWindow) {
    // const selectedIconValue = document.querySelector('#selected-icon').value;

    const firstCheckedIconOption = document.querySelector('.icon-option:checked');
    const selectedIconValue = firstCheckedIconOption ? firstCheckedIconOption.value : null;
    const labels = document.querySelectorAll('.icon-label');

    labels.forEach(label => {
      const radioButton = label.querySelector('input[type="radio"]');
      if (radioButton && radioButton.value === selectedIconValue) {
        label.classList.add('selected');
      }

      // add event listener to each label
      label.addEventListener('click', function() {
        if (radioButton) {
          radioButton.click();
          selectIcon(radioButton); 
        }
      });
    });
  }
});


function selectIcon(radioButton) {
  var selectedIcon = radioButton.value;
  radioButton.checked = true;
  
  var selectedIconField = document.getElementById('selected-icon');
  var currentIconValue = selectedIconField.value;
  
  if (selectedIcon === currentIconValue) {
    radioButton.checked = false;
    selectedIconField.value = ''; 
  } else {
    selectedIconField.value = selectedIcon;
  }

  const labels = document.querySelectorAll('.icon-label');

  labels.forEach(label => {
    label.classList.remove('selected');
  });

  const selectedLabel = radioButton.closest('.icon-label');
  selectedLabel.classList.add('selected');
};
