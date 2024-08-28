import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'template', 'container' ]
  static values = { index: Number }
  
  connect() {
    //make indexValue equal to the number of new passengers forms initially created
    this.indexValue = document.querySelectorAll(".newcomer").length
    console.log(this.indexValue)
  }

  add() {
    console.log(this.templateTarget.content)

    const passengerHeader = this.templateTarget.content.querySelector('h3')
    passengerHeader.textContent = `Passenger ${this.indexValue + 1}`

    const inputs = this.templateTarget.content.querySelectorAll('input')

    //select input for form and make id equal to indexValue
    const inputName = inputs[0]
    inputName.name = `booking[passengers_attributes][${this.indexValue}][name]`
    inputName.id = `booking_passengers_attributes_${this.indexValue}_name`

    const inputEmail = inputs[1]
    inputEmail.name = `booking[passengers_attributes][${this.indexValue}][email]`
    inputEmail.id = `booking_passengers_attributes_${this.indexValue}_email`
    
    //select label for form and make id equal to indexValue
    const labels = this.templateTarget.content.querySelectorAll('label')

    const labelName = labels[0]
    labelName.setAttribute('for', `booking_passengers_attributes_${this.indexValue}_name`)

    const labelEmail = labels[1]
    labelEmail.setAttribute('for', `booking_passengers_attributes_${this.indexValue}_name`)

    this.containerTarget.appendChild(this.templateTarget.content.cloneNode(true))

    //increment the indexValue by 1 so that the id changes with successive form additions
    this.indexValue += 1
    console.log(this.indexValue)
  }

  remove() {
    const container = document.querySelectorAll(".newcomer");

    if(container.length > 1){
      container[container.length - 1].remove();
      this.countValue--;

      // decrement the indexValue by 1 when an add passenger form is removed
      this.indexValue -= 1
      console.log(this.indexValue)
    }
  }
}
