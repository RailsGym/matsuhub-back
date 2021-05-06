class Api::V1::CanvasController < Api::V1::ApplicationController
  before_action :set_canvas, only: %i[show]

  def index
    canvas = Canvas.where(owner_id: current_user.id)
    render json: {canvases: canvas}
  end

  def show
    labels = @canvas.labels
    areas = Area.all.map do |area|
              area_label_hash = labels.where(area: area).map do |label|
                { id: label.id, title: label.title, position: label.position }
              end
              { id: area.id, area_type: area.area_type, area_type_text: area.area_type_text, description: area.description, labels: area_label_hash }
            end
    render json: { canvas: { title: @canvas.title, areas: areas } }
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

  def set_canvas
    @canvas = Canvas.find(params[:id])
  end
end
