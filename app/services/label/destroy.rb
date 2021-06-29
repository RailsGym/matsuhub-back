class Label::Destroy < ApplicationService
  object :label, class: Label

  def execute
    errors.merge!(canvas.errors) unless label.destroy
    label
  end
end