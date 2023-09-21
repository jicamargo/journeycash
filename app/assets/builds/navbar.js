// document.addEventListener('DOMContentLoaded', function() {
  // Find the hamburger button and the dropdown menu
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
// });


  // document.querySelector('.menu-btn-cnt').addEventListener('click', (e) => {
  //     document.querySelector('.overlay').classList.toggle('active');
  //     document.querySelector('.navbar-menu').classList.toggle('active');
  //     document.querySelector('.menu-btn-cnt').classList.toggle('btn-on');
  //     document.querySelector('.menu')
  //     document.querySelector('.menu-btn').classList.toggle('menu-btn-on');
  //     });
  //   document.querySelector('.menu-close').addEventListener('click', (e) => {
  //     document.querySelector('.overlay').classList.toggle('active');
  //     document.querySelector('.navbar-menu').classList.toggle('active');
  //     document.querySelector('.menu-btn-cnt').classList.toggle('btn-on');
  //     document.querySelector('.menu')
  //     document.querySelector('.menu-btn').classList.toggle('menu-btn-on');
  //   });
