class Api::V1::CanvasController < Api::V1::ApplicationController
  def index
    canvas = Canvas.where(owner_id: current_user.id)
    render json: {canvases: canvas}
  end
end