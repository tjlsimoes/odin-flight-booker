import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static values = { "nbr": Number }
  static targets = [ "nbrPassEl", "label", "name" ]

  add() {
	if ("content" in document.createElement("template")) {
    const nbr_passengers = this.nbrPassElTarget.value
    
    console.log(nbr_passengers)
		
    const template = document.querySelector("#new_passenger")

		const pass_fields = document.querySelector("#passenger_fields")

    const clone = template.content.cloneNode(true)
		pass_fields.appendChild(clone)

    console.log(this.nameTarget)
    console.log(this.emailTarget)
    console.log(this.labelTargets)
	}
  }
}
