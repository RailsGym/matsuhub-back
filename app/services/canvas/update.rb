class Canvas::Update < ApplicationService
  object :canvas, class: Canvas
  string :title

  validates :title,
  presence: true

  def execute
    if canvas.update(title: title)
      canvas
    end
  end
end