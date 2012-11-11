# *************************************************************
# variables
arrow_time = 30000


# *************************************************************
# binging
jQuery ->
  $("#arrow").click ->
    go_to_by_scroll('.container:first', 0, 0)

  setTimeout ->
    arrow_animation()
  , arrow_time


# *************************************************************
# window namespace
window.go_to_by_scroll = (obj, allowed_margin, up_limit) ->
  current = $(document).scrollTop()
  destination = $(obj).offset().top
  allowed_min = destination - allowed_margin
  allowed_max = destination + allowed_margin
  destination -= up_limit if destination >= up_limit
  if current < allowed_min or current > allowed_max
    $('html,body').animate
      scrollTop: destination, 'slow'


# *************************************************************
# Private functions
arrow_animation = ->
  speed = 200
  $('#arrow').animate(
    'padding-bottom': '10px'
  , speed)
  .animate(
    'padding-bottom': '0px'
  , speed)
  .animate(
    'padding-bottom': '10px'
  , speed)
  .animate(
    'padding-bottom': '0px'
  , speed, ->
    setTimeout ->
      arrow_animation()
    , arrow_time)
