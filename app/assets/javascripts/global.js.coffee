# *************************************************************
# variables
arrow_time = 30000
arrow_speed = 200
arrow_animation_lock = false


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
  run_arrow_animation()

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

  # arrow mouseenter
  $('#arrow').mouseenter ->
    arrow_animation_lock = true
    $('#arrow').animate(
      'padding-bottom': '5px'
    , arrow_speed)
  .mouseleave ->
    arrow_animation_lock = false
    $('#arrow').animate(
      'padding-bottom': '0'
    , arrow_speed)


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
run_arrow_animation = ->
  setTimeout ->
    arrow_animation()
  , arrow_time

arrow_animation = ->
  unless arrow_animation_lock
    $('#arrow').animate(
      'padding-bottom': '10px'
    , arrow_speed)
    .animate(
      'padding-bottom': '0px'
    , arrow_speed)
    .animate(
      'padding-bottom': '10px'
    , arrow_speed)
    .animate(
      'padding-bottom': '0px'
    , arrow_speed, ->
      run_arrow_animation())
  else
    run_arrow_animation()

