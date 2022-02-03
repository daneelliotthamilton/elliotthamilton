let flatpickrInstances = new Array
let select2Instances = new Array

function setupFlatPickr (){
  let $datetimeSelectors = Array.from(document.querySelectorAll('.datetimepicker'))
  let $datepickerSelectors = Array.from(document.querySelectorAll('.datepicker'))
  let $timepickersSelectors = Array.from(document.querySelectorAll('.timepicker'))
  if ($datetimeSelectors.length > 0){
    $datetimeSelectors.forEach((element)=>{
      let fp = flatpickr(element, {
        wrap: true,
        enableTime: true,
        dateFormat: "Y-m-d H:i",
        altInput: true,
        altFormat: "F j, Y, H:i"
      });
      flatpickrInstances.push(fp)
    });
  }
  if ($datepickerSelectors.length > 0){
    $datepickerSelectors.forEach( (element) =>{
      let flatpickrInstance = flatpickr(element, {
        wrap: true,
        enableTime: false,
        dateFormat: "Y-m-d",
        altInput: true,
        altFormat: "F j, Y"
      })
      flatpickrInstances.push(flatpickrInstance)
    });
  }
  if ($timepickersSelectors.length > 0){
    $timepickersSelectors.forEach( (element) =>{
      let flatpickrInstance = flatpickr(element, {
        wrap: true,
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i"
      })
      flatpickrInstances.push(flatpickrInstance)
    });
  }
}

function deleteFlatpickr (){
  if (flatpickrInstances.length > 0) {
    flatpickrInstances.forEach((element)=>{
      element.destroy()
    })
  }
}
function setupSelect2 (){
  if ($('.select2').length > 0){
    $('.select2').select2({
      placeholder: $('.select2').data('placeholder'),
      width: '100%'
    });
  }
}

document.addEventListener('turbo:load', ()=>{
  $(document).on('cocoon:after-insert', '.nested-field', ()=>{
    setupFlatPickr()
  })
  setupFlatPickr()
  $('.select2').select2({
    placeholder: $('.select2').data('placeholder'),
    width: '100%'
  });
  $('.select2-tokenizer').select2({
    placeholder: $('.select2-tokenizer').data('placeholder'),
    width: '100%',
    tags: true,
    tokenSeparators: [',']
  })
});
