role = {}
App.role = role

role.updatePermission = (role_id, permit_id) ->
  check = $('#perm-' + permit_id).is(':checked')
  if check
    req_method = 'POST'
  else
    req_method = 'DELETE'
  $.ajax
    url: '/roles/' + role_id + '/permissions/' + permit_id
    type: req_method
  return

# POST /roles/1/permissions/3
# DELETE /roles/1/permissions/3
