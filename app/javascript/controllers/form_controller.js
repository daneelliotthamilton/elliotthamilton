import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    $('.select2').select2({
      placeholder: $('.select2').data('placeholder'),
      width: '100%'
    })
  }

  displayErrors:(errors) {
    $(this).prepend(`<div class="alert alert-danger" role='alert'>A few errors are preventing you from continuing.</div>`)

  }
}
