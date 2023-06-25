module ApiHelper
  def generate_token(user)
    JWT.encode({user_id: user.id}, 'yourSecret')
  end

  def decoder_token(token)
    JWT.decode(token, 'yourSecret', true, algorithm: 'HS256')[0]
  end
end