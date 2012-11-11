# *************************************************************
# binging
jQuery ->
  $("#arrow").click ->
    go_to_by_scroll('.container:first', 0, 0)

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
