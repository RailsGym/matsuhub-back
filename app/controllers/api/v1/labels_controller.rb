class Api::V1::LabelsController < Api::V1::ApplicationController
  before_action :set_canvas, only: %i[create]
  before_action :set_label, only: %i[update destroy]

  def create
    label = @canvas.labels.new(label_params)
    label.created_user = current_user
    if label.save
      render json: { label: label, errors: [] }
    else
      render json: { errors: label.errors.full_messages }, status: :bad_request
    end
  end

  def update
    outcome = Label::Update.run(label_params.merge(label: @label, user: current_user))

    if outcome.valid?
      render json: { label: outcome.result, errors: [] }
    else
      render json: { errors: outcome.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    outcome = Label::Destroy.run(label: @label)

    if outcome.valid?
      render json: { label: outcome.result, errors: [] }
    else
      render json: { errors: outcome.errors.full_messages }, status: :bad_request
    end
  end

  private

  def set_canvas
    @canvas = current_user.canvas.find(params[:canvas_id])
  end

  def set_label
    canvas = current_user.canvas.find(params[:canvas_id])
    @label = canvas.labels.find(params[:label_id])
  end

  def label_params
    params.require(:label).permit(:area_id, :title, :description)
  end
end