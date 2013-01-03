class MathScreen < ProMotion::Screen
  title "Math"

  def on_appear
    view.backgroundColor = UIColor.whiteColor
  end

  def on_opened
    set_tab_bar_item title: "Math", icon: "math.png"
  end

end
