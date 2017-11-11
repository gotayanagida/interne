# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# //= require jquery


$ ->
  do ->
    replaceSelectOptions = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        option = $('<option>').val(this.id).text(this.work_started_at)
        $select.append(option)

    replaceScheduleOptions = ->
      schedulePath = $(@).find('option:selected').data().schedulePath
      $selectSchedule = $(@).closest('form').find('.select-schedule')
      if schedulePath?
        $.ajax
          url: schedulePath
          dataType: "json"
          success: (results) ->
            replaceSelectOptions($selectSchedule, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replaceScheduleOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replaceSelectOptions($selectSchedule, [])

    $('.select-user').on
      'change': replaceScheduleOptions
