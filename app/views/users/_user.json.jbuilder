json.extract! user, :id, :email, :admin, :ia_admin, :it_admin, :customer, :lab_id
json.url user_url(user, format: :json)