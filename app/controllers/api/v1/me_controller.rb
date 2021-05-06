class Api::V1::MeController < Api::V1::ApplicationController
  def show
    render json: { user: current_user }
  end
end