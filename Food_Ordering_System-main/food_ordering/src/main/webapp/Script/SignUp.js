document.addEventListener("DOMContentLoaded", function() {
    const toggleButton = document.getElementById("toggleButton");
    const textAreaContainer = document.getElementById("textAreaContainer");
    const insertTextArea = document.getElementById("insertTextArea");

    toggleButton.addEventListener("click", function() {
        if (textAreaContainer.style.display === "none" || textAreaContainer.style.display === "") {
            // Expand the text area
            textAreaContainer.style.display = "block";
            toggleButton.textContent = "Are you Customer?";
            insertTextArea.style.height = (insertTextArea.scrollHeight) + "px";
            insertTextArea.focus();
        } else {
            // Condense the text area
            textAreaContainer.style.display = "none";
            toggleButton.textContent = "Are you Driver?";
            insertTextArea.value = ""; // Clear the text area content
            insertTextArea.style.height = "auto"; // Reset the height
        }
    });

    // Automatically expand the textarea as the user types
    insertTextArea.addEventListener("input", function() {
        this.style.height = "auto";
        this.style.height = (this.scrollHeight) + "px";
    });
});

//-----------------------Password forget 
let password = document.getElementById('password');
let toggleBtn = document.getElementById('toggleBtn');

let lowerCase = document.getElementById('lower');
let upperCase = document.getElementById('upper');
let digit = document.getElementById('number');
let specialChar = document.getElementById('special');
let minLength = document.getElementById('length');

function checkPassword(data){
	const lower = new RegExp('(?=.*[a-z])');
	const upper = new RegExp('(?=.*[A-Z])');
	const number = new RegExp('(?=.*[0-9])');
	const special = new RegExp('(?=.*[!@#\$%\^&\*])');
	const length = new RegExp('(?=.{8,})');

	if(lower.test(data)){
		lowerCase.classList.add('valid');
	} else {
		lowerCase.classList.remove('valid');
	}

	if(upper.test(data)){
		upperCase.classList.add('valid');
	} else {
		upperCase.classList.remove('valid');
	}

	if(number.test(data)){
		digit.classList.add('valid');
	} else {
		digit.classList.remove('valid');
	}

	if(special.test(data)){
		specialChar.classList.add('valid');
	} else {
		specialChar.classList.remove('valid');
	}

	if(length.test(data)){
		minLength.classList.add('valid');
	} else {
		minLength.classList.remove('valid');
	}
}



toggleBtn.onclick = function(){
	if (password.type === 'password') {
		password.setAttribute('type', 'text');
		rpass.setAttribute('type', 'text');
		toggleBtn.classList.add('hide');

	} else {
		password.setAttribute('type', 'password'); 
		rpass.setAttribute('type', 'password');
		toggleBtn.classList.remove('hide');
	}
}


function togglePopup(){
	document.getElementById("popup-1").classList.toggle("active");
}

