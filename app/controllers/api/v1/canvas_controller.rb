class Api::V1::CanvasController < Api::V1::ApplicationController
  def index
    canvas = Canvas.where(owner_id: current_user.id)
    render json: {canvases: canvas}
  end

  def show
    canvas = Canvas.find(params[:id])
    labels = canvas.labels
    areas = 
      areas_array = []
      Area.all.each do |area|
        if labels.where(area_id: area.id).present?
          labels_array = []
          labels.where(area_id: area.id).each do |label|
            labels_array << {id: label.id, title: label.title, position: label.position}
          end
          areas_array << [id: area.id, area_type: area.area_type, area_type_text: area.area_type_text, description: area.description, label: labels_array]
        else
          areas_array << [id: area.id, area_type: area.area_type, description: area.description, label: []]
        end
      end
      
    canvas_area_label = {title: canvas.title, area: areas}
    render json: {canvas: canvas_area_label}
  end
end 
