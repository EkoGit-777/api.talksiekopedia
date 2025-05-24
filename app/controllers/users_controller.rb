class UsersController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    passcode = request.headers["Passcode"]
    users = User.includes(:rooms_1, :rooms_2).where.not(passcode: passcode).as_json(
      include: [:rooms_1, :rooms_2]
    )
    render json: users
  end

  def create
    passcode = ''
    loop do
      passcode = SecureRandom.urlsafe_base64(8)
      break passcode unless User.exists?(:passcode => passcode)
    end
    newUser = User.create(name: params[:name], avatar: params[:avatar], passcode: passcode)
    if(newUser.errors.full_messages.length > 0)
      render json: newUser.errors.full_messages
    else
      render json: newUser
    end
  end

  def show
    passcode = request.headers["Passcode"]
    user = User.find_by(passcode: passcode)
    if user
      render json: user
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
end
