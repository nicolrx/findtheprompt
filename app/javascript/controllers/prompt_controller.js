import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "letterField" ]

  correct() {
    var letterField = this.letterFieldTarget;
		var correction = letterField.getAttribute("data-answer");
		var userInput = letterField.value;

		if(correction.toLowerCase() === userInput.toLowerCase()) {
			letterField.classList.remove("false");
			letterField.classList.add("true");
			letterField.setAttribute('disabled', '');
			this._checkIfFinished();
		} else {
			letterField.classList.remove("true");
			letterField.classList.add("false");
		}
  }

	_checkIfFinished() {
		var inputs = document.querySelectorAll('.letter-field');
		var check = true;
		inputs.forEach(function(item) {
			if (!item.classList.contains("true")) {
				check = false;
			}
		});

		if(check == true) {
			console.log("VICTOIRE !");
		}
	}
}
