import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reservation-modal"
export default class extends Controller {
  static targets = ["inputStartDate", 'inputEndDate', 'startDate', 'endDate'];
  static values = {
    price: Number
  }

  connect() {
    console.log("Hello reservation_modal.js");
    console.log(this)
  }

  displayContent() {
   const start = this.inputStartDateTarget.value
   const end = this.inputEndDateTarget.value
   console.log(start, end)
   this.startDateTarget.innerText = start
   this.endDateTarget.innerText = end
   const startDate = new Date(start);
   const endDate = new Date(end)
   console.log(endDate - startDate)
   const diffInDays = (endDate - startDate)/((1000*60*60*24))
   this.priceValue*diffInDays
   console.log(this.priceValue*diffInDays)
  }


}
