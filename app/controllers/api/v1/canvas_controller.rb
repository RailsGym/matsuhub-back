class Api::V1::CanvasController < Api::V1::ApplicationController
  before_action :set_canvas, only: %i[show]

  def index
    canvas = Canvas.where(owner_id: current_user.id)
    render json: {canvases: canvas}
  end

  def show
    outcome = Canvas::Show.run(canvas: @canvas)

    if outcome.valid?
      render json: { errors: [] }.merge(outcome.result)
    else
      render json: { errors: outcome.errors.full_messages }
    end
  end

  def create
    @canvas = Canvas.new(canvas_params)
    @canvas.owner = current_user
    if @canvas.save
      @canvas.canvas_members.create(user_id: current_user.id, authority: 'admin')
      render json: { canvas: @canvas, errors: [] }
    else
      render json: { errors: @canvas.errors.full_messages }
    end
  end

  private

  def canvas_params
    params.require(:canva).permit(:title)
  end

  def set_canvas
    @canvas = Canvas.find(params[:id])
  end
end
