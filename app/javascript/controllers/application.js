import { Application } from "@hotwired/stimulus"
import "jquery";

window.$ = window.jQuery = jQuery;

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
