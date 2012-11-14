# *************************************************************
# variables
arrow_time = 30000
arrow_speed = 200
arrow_animation_lock = false
dot_animation_lock = false
photo_animation_lock = false


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
    $('#arrow').animate(
      'padding-bottom': '0'
    , arrow_speed, ->
      arrow_animation_lock = false
    )

  # schedule dots animation
  $('div.strap').mouseenter ->
    unless dot_animation_lock
      dot_animation_lock = true

      dot = $(this).find('.dot')
      dot_width = dot.width()
      dot_margin_left = dot.css('margin-left')
      dot_bg = dot.css('background-color')

      dot.animate(
        width: '20px',
        backgroundColor: '#7fd600'
      , 200, ->
        $(this).animate(
          width: "#{dot_width}px",
          marginLeft: '20px'
        , 200, ->
          $(this).animate(
            width: "#{dot_width}px",
            marginLeft: dot_margin_left,
            backgroundColor: dot_bg
          , 300, ->
            dot_animation_lock = false
          )
        )
      )

  # speaker photo animation
  $('.speaker_container').mouseenter ->
    $(this).find('.gray_layer').animate
      opacity: 0
  .mouseleave ->
    $(this).find('.gray_layer').animate
      opacity: 0.2

  #$('.speaker_container').mouseenter ->
    #unless photo_animation_lock
      #photo_animation_lock = true
      #photo = $(this).find('.photo')
      #photo.transition
      #  perspective: '200px'
      #  rotateX: '+=10deg'
      #  rotateY: '+=10deg'
      #, ->
      #  photo.transition
      #    perspective: '200px'
      #    rotateX: '-=10deg'
      #    rotateY: '-=10deg'
      #  , ->
      #    photo_animation_lock = false


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

# speaker_id e.g. '#speaker_1'
window.jump_to_speaker = (obj, speaker_id) ->
  #console.log('jump to speaker')
  $(obj).transition
    perspective: '100px'
    rotateX: '+=360deg'
  , 600

  setTimeout(->
    go_to_by_scroll(speaker_id, 0, 20)
  , 200)

  # turn off highlight for all speakers
  $('.speaker_container').find('.gray_layer').animate
    opacity: 0.2

  setTimeout(->
    h2 = $(speaker_id).find('h2')
    h2.animate
      width: '+=60'
      borderColor: '#fff'
    , ->
      h2.animate
        width: '-=60'
        borderColor: '#b2b2b2'
      , 2000

    # highlight speaker face
    gray_layer = $(speaker_id).find('.gray_layer')
    gray_layer.animate
      opacity: 0
  , 400)


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

