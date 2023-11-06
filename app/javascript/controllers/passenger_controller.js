import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passenger"
export default class extends Controller {
  static values = { "nbr": Number }
  static targets = [ "nbrPassEl", "label", "name", "email" ]

  add() {
	if ("content" in document.createElement("template")) {
    const nbr_passengers = ++this.nbrPassElTarget.value
  
    console.log(nbr_passengers)
		
    const template = document.querySelector("#new_passenger")
	  const pass_fields = document.querySelector("#passenger_fields")

    const clone = template.content.cloneNode(true)
		pass_fields.appendChild(clone)

    const name_attr = `booking[passengers_attributes][${nbr_passengers - 1}][name]`;
    const email_attr = `booking[passengers_attributes][${nbr_passengers - 1}][email]`;

    // Strings are different for filling out id value.

    this.nameTargets.slice(-1)[0].setAttribute("name", name_attr)
    this.emailTargets.slice(-1)[0].setAttribute("name", email_attr)

    this.nameTargets.slice(-1)[0].setAttribute("id", name_attr)
    this.emailTargets.slice(-1)[0].setAttribute("id", email_attr)

    let i = 1;
    this.labelTargets.slice(-2).map((label) => {
      if (i == 1) {
        label.setAttribute("for", name_attr)
      } else {
        label.setAttribute("for", email_attr)
      }
      i++;
    })

    console.log(this.labelTargets)
	}
  }
}
