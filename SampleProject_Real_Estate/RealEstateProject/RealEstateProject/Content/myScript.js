var modal = document.getElementById("myModal");

var boxModals = document.querySelectorAll("svg.myModalBox");

var index = 0;
for (var i = 0; i < boxModals.length; i++) {
    boxModals[i].addEventListener("mouseover", display);
}









//boxModals[0].addEventListener("mouseover", display(this));
//console.log(boxModals[0]);
//console.log(modal);

function display(x) {

   // modal.style.display = "block";
    var rect = x.getBoundingClientRect();
    var modal = document.createElement("div");
    modal.className = "modal";
    var modalContent = document.createElement("div");
    modalContent.className = "modal-content";
    var content = document.createTextNode("Estimation is calculated based on tax assessment records, recent sale prices of comparable properties, and other factors.");
    modalContent.appendChild(content);
    modal.appendChild(modalContent);

    var rect = x.getBoundingClientRect();

    var parent = x.parentElement.parentElement;
    console.log(parent);
    parent.appendChild(modal);
    modal.style.display = "block";
    // reset modal to display none after a short delay
    setTimeout(function() {
    modal.style.display = "none";
  }, 2000);
}




