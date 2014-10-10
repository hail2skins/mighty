# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
	$("#customers").dataTable
  	sPaginationType: "bootstrap"
  	"bRetrieve": true
  	"bDestroy": true

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:restore', ready)


