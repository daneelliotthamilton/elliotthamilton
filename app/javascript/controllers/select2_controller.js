import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {
    console.log("We Here bad man!")
    $('.select2').select2({
        placeholder: $('.select2').data('placeholder'),
        width: '100%'
      })
    }


  disconnect(){
    $('.select2').select('destroy')
  }
}
