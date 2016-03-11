module UI
  module Text
    def text_alignment
      case (container.gravity & Android::View::Gravity::HORIZONTAL_GRAVITY_MASK)
        when Android::View::Gravity::LEFT
          :left
        when Android::View::Gravity::RIGHT
          :right
        else
          :center
      end
    end

    def text_alignment=(sym)
      val = Android::View::Gravity::CENTER_VERTICAL
      val |= case sym
        when :left
          Android::View::Gravity::LEFT
        when :center
          Android::View::Gravity::CENTER_HORIZONTAL
        when :right
          Android::View::Gravity::RIGHT
        else
          raise "Incorrect value, should be :left, :center or :right"
      end
      container.gravity = val
    end

    def color
      UI::Color(container.textColor)
    end

    def color=(color)
      container.textColor = UI::Color(color).container
    end

    def text=(text)
      container.text = text
    end

    def text
      container.text
    end

    def font
      UI::Font._wrap(container.typeface, container.textSize)
    end

    def font=(font)
      font = UI::Font(font)
      container.setTypeface(font.container)
      container.setTextSize(font.size)
    end
  end
end
