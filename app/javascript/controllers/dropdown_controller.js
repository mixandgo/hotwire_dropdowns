import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  submit() {
    this.element.requestSubmit();
  }
}
