class Api::V1::CanvasController < Api::V1::ApplicationController

  def index
    canvas = Canvas.where(owner_id: current_user.id)
    render json: {canvases: canvas}
  end

  def create
    @canvas = Canvas.new(canvas_params)
    @canvas.owner = current_user
    if @canvas.save
      render json: { canvas: @canvas, errors: [] }
    else
      render json: { errors: @canvas.errors.full_messages }
    end
  end

  private

  def canvas_params
    params.require(:canvas).permit(:title)
  end
end