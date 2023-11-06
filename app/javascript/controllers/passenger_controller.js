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

    const pname_name_attr = `booking[passengers_attributes][${nbr_passengers - 1}][name]`;
    const pemail_name_attr = `booking[passengers_attributes][${nbr_passengers - 1}][email]`;
  
    const pname_id_attr = `booking_passengers_attributes_${nbr_passengers - 1}_name`;
    const pemail_id_attr = `booking_passengers_attributes_${nbr_passengers - 1}_email`;

    // Strings are different for filling out id value.

    this.nameTargets.slice(-1)[0].setAttribute("name", pname_name_attr)
    this.emailTargets.slice(-1)[0].setAttribute("name", pemail_name_attr)

    this.nameTargets.slice(-1)[0].setAttribute("id", pname_id_attr)
    this.emailTargets.slice(-1)[0].setAttribute("id", pemail_id_attr)

    let i = 1;
    this.labelTargets.slice(-2).map((label) => {
      if (i == 1) {
        label.setAttribute("for", pname_id_attr)
      } else {
        label.setAttribute("for", pemail_id_attr)
      }
      i++;
    })

    console.log(this.labelTargets)
	}
  }
}
