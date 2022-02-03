
function formatTagsData (selected){
      const data = []
      $.each(selected, function (index,obj) {
        console.log(obj)
        let selection = {
          "id": obj[0],
          "text": obj[1],
          "selected": true
        } // replace pk with your identifier
        data.push(selection)
      })
    return data
  }

function tagsSelect () {
  if ($('.tags-select').length > 0){
    $('.tags-select').select2({
      placeholder: $('.tags-select').data('placeholder'),
      width: '100%',
      tags: true,
      allowClear: true,
      data: formatTagsData($('.tags-select').data('selected')),
      ajax: {
        url: '/insights/tags.json',
        dataType: 'json',
        delay: 250,
        data: function (params){
          return{
            q: params.term,
            page: params.page || 1
          };
        },
        processResults: function(data, params) {

          params.page = params.page || 1;

          return{
            results: data.results,
            pagination: {
              more: (params.page * 30) < data.total_count
            }
          }
        }
      },
      cache: true
    });
  }
}

document.addEventListener('turbo:load', ()=>{
  tagsSelect()
});
