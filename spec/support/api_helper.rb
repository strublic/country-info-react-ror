module ApiHelper
  def generate_token()
    jwt = JWT.encode({user_id: user.id}, 'yourSecret')
  end
end