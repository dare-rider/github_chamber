$(document).ready(function(){

  $('.start-date').datepicker({
    format: 'yyyy/mm/dd'
  })

  $('.end-date').datepicker({
    format: 'yyyy/mm/dd',
    endDate: new Date()
  })

})
