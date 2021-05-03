class Api::V1::CanvasController < Api::V1::ApplicationController

  def create
    @canvas = Canvas.new(canvas_params)
    owner_id = current_user.id
    if @canvas.save!
      @canvas.assign_attributes(owner_id: owner_id)
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