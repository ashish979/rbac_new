user = {}
App.user = user

user.updateRole = (user_id, role_id) ->
  role_element = $('#role-' + role_id)
  check = role_element.is(':checked')

  if check
    task = 'assign_role'
  else
    task = 'unassign_role'
  $.ajax
    url: '/users/' + user_id + '/' + task
    type: 'POST'
    data: role_id: role_id
    error: (data) ->
      console.log(data.error)
    success: (data) ->
      console.log(data.success)
  return
