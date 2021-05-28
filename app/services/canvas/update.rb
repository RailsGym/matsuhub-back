class Canvas::Update < ApplicationService
  object :canvas, class: Canvas
  string :title

  def execute
    if canvas.update(title: title)
      { canvas: canvas, errors: [] }
    else
      { errors: canvas.errors.full_messages}
    end
  end
end