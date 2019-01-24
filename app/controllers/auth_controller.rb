class AuthController < ApplicationController
  skip_before_action :authenticate

  # just test JWT for Bearer Authentication =)
  def create
    payload = {
      user: {
        name: Faker::Name.name,
        email: Faker::Internet.email
      }
    }

    jwt = Auth.issue(payload)

    render json: { jwt: jwt }
  end
end
