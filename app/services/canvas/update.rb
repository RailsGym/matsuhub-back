class Canvas::Update < ApplicationService
  object :canvas, class: Canvas
  string :title

  validates :title,
  presence: true

  def execute
    errors.merge!(canvas.errors) unless canvas.update(title: title)
    canvas
  end
end