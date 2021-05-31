class Api::V1::CanvasesController < Api::V1::ApplicationController
  before_action :set_canvas, only: %i[show]

  def index
    canvases = Canvas.where(owner_id: current_user.id)
    render json: canvases
  end

  def show
    outcome = Canvas::Show.run(canvas: @canvas)

    if outcome.valid?
      render json: { errors: [] }.merge(outcome.result)
    else
      render json: { errors: outcome.errors.full_messages }, status: :bad_request
    end
  end

  def create
    @canvas = Canvas.new(canvas_params)
    @canvas.owner = current_user
    @canvas.canvas_members.build(user: current_user, authority: :admin)
    if @canvas.save
      render json: { canvas: @canvas, errors: [] }
    else
      render json: { errors: @canvas.errors.full_messages }, status: :bad_request
    end
  end

  private

  def canvas_params
    params.require(:canvas).permit(:title)
  end

  def set_canvas
    @canvas = Canvas.find(params[:id])
  end
end
