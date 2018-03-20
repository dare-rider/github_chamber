$(document).ready(function(){

  $('.start-date').datepicker({
    format: 'yyyy/mm/dd',
    endDate: new Date()
  })

  $('.end-date').datepicker({
    format: 'yyyy/mm/dd',
    endDate: new Date()
  })

})

if(gon.commits){
  commits = []
  gon.commits.forEach(function(commit){
    commits.push({name: commit.committer + "<br/>Message: " + commit.message + "<br/>", date: commit.date, img: commit.image_path})
  });
  TimeKnots.draw("#timeline1", commits, {dateFormat: "%d %B %Y %H:%M", color: "#696", showLabels: true, labelFormat: "%Y"});
}

