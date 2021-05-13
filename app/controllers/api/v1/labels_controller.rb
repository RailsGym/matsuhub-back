class Api::V1::LabelsController < Api::V1::ApplicationController
  before_action :set_canvas, only: %i[create]

  def create
    label = @canvas.labels.new(label_params)
    label.created_user = current_user
    if label.save
      render json: { label: label, errors: [] }
    else
      render json: { errors: label.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_canvas
    # FIXME: パラメータ名をcanvas_idにしたい
    @canvas = current_user.canvas.find(params[:canva_id])
  end

  def label_params
    params.require(:label).permit(:area_id, :title)
  end
end