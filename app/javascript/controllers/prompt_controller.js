import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	static targets = [ "letterField" ]

	connect() {
		this._selectNextElement();
	}

  correct() {
		this._launchTimer();
    var letterField = this.letterFieldTarget;
		var correction = letterField.getAttribute("data-answer");
		var userInput = letterField.value;

		if(correction.toLowerCase() === userInput.toLowerCase()) {
			letterField.classList.remove("false");
			letterField.classList.add("true");
			letterField.setAttribute('disabled', '');
			this._selectNextElement();
			this._checkIfFinished();
		} else {
			letterField.classList.remove("true");
			letterField.classList.add("false");
		}
  }

	_selectNextElement() {
		var inputs = document.querySelectorAll('.letter-field');
		let nextEle;
		for (var i = 0; i < inputs.length; i++) {
			if (!inputs[i].classList.contains("true")) {
				nextEle = inputs[i];
				break;
			}
		}
		if(nextEle) {
			nextEle.focus();
			nextEle.select();
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
			let timer = document.getElementById("timer");
			let score = timer.innerText;
			timer.style.display = "none"; 

			// show results
			var twitter = document.getElementById("twitter_share");
			var twitter_text = twitter.getAttribute("href") + "&text=I found today's prompt in " + score + "!";
			twitter.setAttribute("href", twitter_text);
			var scoreDisplay = document.getElementById("score-result");
			scoreDisplay.innerText = score;
			var resultContainer = document.getElementById("prompt-result-container");
			resultContainer.style.display = "block";

			// fire some confettis
			var count = 325;
			var defaults = {
				origin: { y: 0.625 }
			};

			function fire(particleRatio, opts) {
				confetti(Object.assign({}, defaults, opts, {
					particleCount: Math.floor(count * particleRatio)
				}));
			}

			fire(0.25, {
				spread: 26,
				startVelocity: 50,
			});
			fire(0.2, {
				spread: 60,
			});
			fire(0.35, {
				spread: 100,
				decay: 0.91,
				scalar: 0.8
			});
			fire(0.1, {
				spread: 120,
				startVelocity: 20,
				decay: 0.92,
				scalar: 1.2
			});
			fire(0.1, {
				spread: 120,
				startVelocity: 40,
			});


		}
	}

	_launchTimer() {
		let timer = document.getElementById("timer");
		if(timer.innerText == "00:00") {
			const clock = document.getElementById("timer");
			let time = -1, intervalId;
			function incrementTime() {
				time++;
				clock.textContent =
					("0" + Math.trunc(time / 60)).slice(-2) +
					":" + ("0" + (time % 60)).slice(-2);
			}
			incrementTime();
			intervalId = setInterval(incrementTime, 1000);
		}
	}
}