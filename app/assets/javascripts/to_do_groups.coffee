# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# table1の幅を揃える
$(document).on 'turbolinks:load', ->
    th = $(".table_goals tr").eq(0);
    th_ag = $(".active_goal tr").eq(0);
    th.children().each (index, elm) ->
      width = th.children().eq(index).width()
      th_ag.children().eq(index).width(width)
