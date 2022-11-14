import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {
    console.log(this.element.classList)
    if (this.element.classList.contains('datetime_picker')){
        this.setDateTimeSelect()
    } else if (this.element.classList.contains('date_picker')){
        this.setDateSelect()
    } else if (this.element.classList.contains('time_picker')) {
       this.setTimeSelect()
    } else {
        console.log('Invalid Time Select Element')
    }
  }

  setDateTimeSelect(){
    flatpickr('.datetimepicker', {
        wrap: true,
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        altInput: true,
        altFormat: "F j, Y, H:i"
    })
  }

  setDateSelect(){
   flatpickr('.datepicker', {
        wrap: true,
        enableTime: false,
        dateFormat: "Y-m-d",
        altInput: true,
        altFormat: "F j, Y"
    })
  }

  setTimeSelect(){
   flatpickr('.timepicker', {
        wrap: true,
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i"
    })
  }

  disconnect(){
    let fp = this.element.parentElement._flatpickr
    fp.destroy()
  }
}
