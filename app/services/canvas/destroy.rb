class Canvas::Destroy < ApplicationService
  object :canvas, class: Canvas

  def execute
    errors.merge!(canvas.errors) unless canvas.destroy
  end
end