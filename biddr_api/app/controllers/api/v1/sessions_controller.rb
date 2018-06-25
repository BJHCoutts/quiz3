class Api::V1::SessionsController < ApplicationController
  before_action :authenticate_user!, only: [ :destroy ]

  def create
    user = User.find_by email: params[:email]

    if user&.authenticate params[:password]
      session[:user_id] = user.id
      
      render json: { id: user.id }
    else
      # Use the `head` when you want your response
      # not contain any content. It will only have
      # the HTTP headers.
      head :not_found
    end
  end

  def destroy
    session[:user_id] = nil
    head :ok
  end

end