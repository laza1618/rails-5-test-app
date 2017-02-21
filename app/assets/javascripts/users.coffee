initEvents = ->
  # update input hidden field on each checkbox update
  $(document).on('change', "input[name='select']", (e) ->
    $selectedInput = $("input[name='select']:checked")
    selectedIds = []
    $selectedInput.each((key, input) ->
      selectedIds.push(input.value)
    )
    $("input[type='hidden'][name='user_ids']").val(selectedIds.join(','))

    # Handle action button state (must be disabled when no user is selected)
    if (selectedIds.length is 0)
      $('#btnGroupDrop1').addClass('disabled')
    else
      $('#btnGroupDrop1').removeClass('disabled')
  )

  # Handle action button click
  $('a.user-action').on('click', (e) ->
    e.preventDefault()
    formId = $(e.currentTarget).data('form')
    $("##{formId}").submit()
  )

  # Handle search
  $('.search-input').on('keyup', (e) ->
    $.ajax
      type: 'GET'
      url: '/users/search'
      dataType: 'script'
      format: 'js'
      data:
        term: e.currentTarget.value
  )

$(document).on('turbolinks:load', initEvents)
