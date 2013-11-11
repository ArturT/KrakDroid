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
  #$('.speaker_container').mouseenter ->
  #  $(this).find('.gray_layer').animate
  #    opacity: 0
  #.mouseleave ->
  #  $(this).find('.gray_layer').animate
  #    opacity: 0.2

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

  # blue menu arrow tab when mouseover
  $('.menu_arrow_container').mouseover ->
    if $(this).hasClass('menu_end_left')
      $(this).addClass('active_left_arrow')
    else
      $(this).addClass('active_right_arrow')
  .mouseleave ->
    if $(this).hasClass('menu_end_left')
      $(this).removeClass('active_left_arrow')
    else
      $(this).removeClass('active_right_arrow')

  set_secret_cookie()
  blink_dragon_eye_random()

# *************************************************************
# window namespace
window.go_to_by_scroll = (obj, allowed_margin, up_limit) ->
  if $(obj).length > 0
    current = $(document).scrollTop()
    destination = $(obj).offset().top
    allowed_min = destination - allowed_margin
    allowed_max = destination + allowed_margin
    destination -= up_limit if destination >= up_limit
    if current < allowed_min or current > allowed_max
      $('html,body').animate
        scrollTop: destination, 'slow'
      , ->
        window.location.hash = obj

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
    #h2 = $(speaker_id).find('h2')
    #h2.animate
    #  width: '+=60'
    #  borderColor: '#fff'
    #, ->
    #  h2.animate
    #    width: '-=60'
    #    borderColor: '#b2b2b2'
    #  , 2000

    # highlight speaker face
    gray_layer = $(speaker_id).find('.gray_layer')
    gray_layer.animate
      opacity: 0
  , 400)

window.p4of4_bool = (value) ->
  return p4of4() if value == true
  console.log('nope')

window.blink_dragon_eye = ->
  $('.dragon-eye').animate(
    opacity: 1
    top: '+=15px'
    left: '-=15px'
  , 100).delay(random_number(100,500)).animate
    opacity: 0
    top: '-=15px'
    left: '+=15px'
  , 100


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

set_secret_cookie = ->
  $.cookie('p3of4', 'zLiBQbGVhc2UgY29udGFjdCB3aXRoIG9yZ2Fua', { expires: 7, path: '/' });

p4of4 = ->
  alert('XplcnMgYXQgdGhlIGNvbmZlcmVuY2UgZGF5LiBZb3VyIHNlY3JldCBwYXNzd29yZCBpcyAiY3VyaW9zaXR5Ii4=')

random_number = (min, max) ->
  Math.floor((Math.random()*max)+min)

blink_dragon_eye_random = ->
  setTimeout ->
    blink_dragon_eye()
    blink_dragon_eye_random()
  , random_number(5000, 10000)
