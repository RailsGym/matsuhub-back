class Canvas::Destroy < ApplicationService
  object :canvas, class: Canvas

  def execute
    if canvas.destroy
      canvas
    end
  end
end