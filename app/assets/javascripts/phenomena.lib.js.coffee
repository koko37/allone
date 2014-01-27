class Phenomena.View extends Support.CompositeView

  prepend_and_fade_alert: (container, text, type) ->
    alert_id = (new Date).getTime()
    alert_body = HoganTemplates['shared/alert']
    alert_html = alert_body.render({text: text, id: alert_id, type: type}, {})
    container.prepend(alert_html)
    
    $('#' + alert_id).fadeOut(4000, ->
      $(this).remove()
    )

