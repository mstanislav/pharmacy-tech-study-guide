class LawScreen < ProMotion::Screen
  title "Law"

  def on_appear
    view.backgroundColor = UIColor.whiteColor
  end

  def on_opened
    set_tab_bar_item title: "Law", icon: "law.png"
  end

end
