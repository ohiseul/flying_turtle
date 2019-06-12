var modal = document.getElementById("basicModal");
var modalBtn = document.getElementById("modalBtn");
var closeBtn = document.getElementsByClassName("closeBtn")[0];

// Listeners For Open & Close
modalBtn.addEventListener("click", openModal);
closeBtn.addEventListener("click", closeModal);
window.addEventListener("click", outerExit);

// Func To Open Modal
function openModal() {
	modal.style.opacity = "1";
	modal.style.display = "block";
}

// Func To Close Modal
function closeModal() {
	modal.style.opacity = "0";
	modal.style.display = "none";
}

function outerExit(e) {
	if (e.target == modal) {
		modal.style.display = "none";
	}
} // Get Elements & Store In Vars
var modal = document.getElementById("basicModal");
var modalBtn = document.getElementById("modalBtn");
var closeBtn = document.getElementsByClassName("closeBtn")[0];

// Listeners For Open & Close
modalBtn.addEventListener("click", openModal);
closeBtn.addEventListener("click", closeModal);
window.addEventListener("click", outerExit);

// Func To Open Modal
function openModal() {
	modal.style.opacity = "1";
	modal.style.height = "100%";
}

// Func To Close Modal
function closeModal() {
	modal.style.opacity = "0";
	modal.style.height = '0';
}

function outerExit(e) {
	if (e.target == modal) {
		modal.style.opacity = "0";
		modal.style.height = '0';
	}
}