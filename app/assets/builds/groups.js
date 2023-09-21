document.addEventListener("turbo:load", function() {
  // Obtén la URL actual
  const currentURL = window.location.pathname;

  const pattern = /^\/groups\/\d+\/edit$/; // edit group window e.g: /groups/3/edit
  if (pattern.test(currentURL) || currentURL.includes("/groups/new")) {
    const selectedIconValue = document.querySelector('#selected-icon').value;
    const labels = document.querySelectorAll('.icon-label');

    labels.forEach(label => {
      const radioButton = label.querySelector('input[type="radio"]');
      if (radioButton && radioButton.value === selectedIconValue) {
        label.classList.add('selected');
      }
    });
  }
});

function selectIcon(radioButton) {
  // Obtén el valor del radio button seleccionado
  var selectedIcon = radioButton.value;
  
  // Obtén el campo oculto y su valor actual
  var selectedIconField = document.getElementById('selected-icon');
  var currentIconValue = selectedIconField.value;
  
  // Si el radio button seleccionado es el mismo que el valor actual, deselecciónalo
  if (selectedIcon === currentIconValue) {
    radioButton.checked = false;
    selectedIconField.value = ''; // Limpia el valor del campo oculto
  } else {
    // Si es un icono diferente, actualiza el campo oculto con el nuevo valor
    selectedIconField.value = selectedIcon;
  }

  const labels = document.querySelectorAll('.icon-label');

  labels.forEach(label => {
    label.classList.remove('selected');
  });

  const selectedLabel = radioButton.closest('.icon-label');
  selectedLabel.classList.add('selected');
}





