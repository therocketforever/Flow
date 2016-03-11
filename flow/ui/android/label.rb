module UI
  class Label < UI::View
    include UI::Text

    def initialize
      super
      calculate_measure(true)
      self.text_alignment = :left
    end

    def measure(width, height)
      dim = [width, height]
      unless width.nan?
        layout = Android::Text::StaticLayout.new(container.text, container.getPaint, width, Android::Text::Layout::Alignment::ALIGN_NORMAL, 1, 0, true)
        dim[1] = layout.getHeight
      end
      dim
    end

    def container
      @container ||= Android::Widget::TextView.new(UI.context)
    end
  end
end

