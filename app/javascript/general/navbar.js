// save a local storage message for debugging



document.addEventListener('DOMContentLoaded', function() {
  const hamburgerButton = document.querySelector('.menu-btn-cnt');
  const menuDropdown = document.querySelector('.navbar-menu');
  const overlay = document.querySelector('.overlay');
  const closeButton = document.querySelector('.menu-close');
  
  // Add a click event to the hamburger button
  hamburgerButton.addEventListener('click', function() {
    // Toggle the "active" class on both the hamburger button and the dropdown menu 
    hamburgerButton.classList.toggle('btn-on');
    menuDropdown.classList.toggle('active');
    overlay.classList.toggle('active');
  });
  
  //add click event to the close button
  closeButton.addEventListener('click', function() {
    // Toggle the "active" class on both the hamburger button and the dropdown menu
    hamburgerButton.classList.toggle('btn-on');
    menuDropdown.classList.toggle('active');
    overlay.classList.toggle('active');
  });

  //add click event to the overlay
  overlay.addEventListener('click', function() {
    // Toggle the "active" class on both the hamburger button and the dropdown menu
    hamburgerButton.classList.toggle('btn-on');
    menuDropdown.classList.toggle('active');
    overlay.classList.toggle('active');
  });
});