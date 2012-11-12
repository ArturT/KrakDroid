# *************************************************************
# variables
arrow_time = 30000


# *************************************************************
# binging
jQuery ->
  # click on arrow
  $('#arrow').click ->
    go_to_by_scroll('.container:first', 0, 0)
    $('#arrow').transition
      perspective: '100px'
      rotateY: '+=360deg'

  # run arrow animation
  setTimeout ->
    arrow_animation()
  , arrow_time

  # hide arrow
  $("#top_hook").waypoint ((event, direction) ->
    if direction is "up"
      #console.log "hide"
      $('#arrow').animate
        opacity: 0
      , 400, ->
        $(this).css('display', 'none')
  ),
    offset: "-5"

  # show arrow
  $("#top_second_hook").waypoint ((event, direction) ->
    if direction is "down"
      #console.log "show"
      $('#arrow').css('display', 'block').animate(
        opacity: 1
      , 400)
  ),
    offset: "-20"


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
