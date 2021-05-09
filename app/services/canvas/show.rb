class Canvas::Show < ApplicationService
  object :canvas, class: Canvas

  def execute
    labels = canvas.labels
    areas = Area.all.map do |area|
      area_label_hash = labels.where(area: area).map do |label|
        { id: label.id, title: label.title, position: label.position }
      end
      { id: area.id, area_type: area.area_type, area_type_text: area.area_type_text, description: area.description, labels: area_label_hash }
    end
    { canvas: { title: canvas.title, areas: areas } }
  end
end