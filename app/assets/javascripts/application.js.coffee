# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
# vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https:#github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require rails-ujs
#= require turbolinks
#= require moment
#= require fullcalendar
#= require underscore
#= require rails-ujs
# Loads all Semantic javascripts
#= require semantic-ui
#= require calendar
#= require_tree .

notice = ->

  $('#notice-update-ajax').on 'click', (e) ->
    e.preventDefault()
    updateNotice()

  updateNotice = ->
    console.log ('clicked')
    noticeAjax = $.ajax({
      url: '/notices/update_notice'
      type: 'GET'
      dataType: "html"
      data: {
        hoge: 'value'
      }
    })

    noticeAjax.done (data, stat, xhr) ->
      console.log ('done')
    noticeAjax.fail (xhr, stat, err) ->
      console.log { fail: stat, error: err, xhr: xhr }
      alert xhr.responseText

$(document).ready(notice)
$(document).on('page:load', notice)
