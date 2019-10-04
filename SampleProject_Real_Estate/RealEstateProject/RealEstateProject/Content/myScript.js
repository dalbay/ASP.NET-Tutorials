var modal = document.getElementById("myModal");

var boxModals = document.querySelectorAll("svg.myModalBox");


boxModals[0].addEventListener("mouseover", display);
console.log(boxModals[0]);
console.log(modal);

function display() {
    modal.style.display = "block";
    // reset modal to display none after a short delay
    setTimeout(function() {
    modal.style.display = "none";
  }, 2000);
}




