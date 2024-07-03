import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disabled-button"
export default class extends Controller {
  static targets = ["button"]

  enabled() {
    this.buttonTarget.disabled = false
  }
}
