class MathScreen < ProMotion::Screen
  title "Math"

  def on_appear
    @reference  ||= ReferenceScreen.new(nav_bar: true)
    @quiz       ||= QuizScreen.new(nav_bar: true)
    @math       ||= MathScreen.new(nav_bar: true)
    @tab_bar    ||= open_tab_bar @reference, @quiz, @math
  end

  def on_opened
    set_tab_bar_item title: "Math", icon: "math.png"
  end

end
