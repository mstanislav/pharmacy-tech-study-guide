class ReferenceScreen < ProMotion::GroupedTableScreen
  title "Reference"

  def on_appear
    @reference  ||= ReferenceScreen.new(nav_bar: true)
    @quiz       ||= QuizMenuScreen.new(nav_bar: true)
    @math       ||= MathScreen.new(nav_bar: true)
    @tab_bar    ||= open_tab_bar @reference, @quiz, @math
  end

  def on_opened
    set_tab_bar_item title: "Reference", icon: "reference.png"
  end

  def table_data
    [{
      title: "Drugs by...",
      cells: [
        { title: "Brand Name", action: :brands },
        { title: "Generic Name", action: :generics },
        { title: "Purpose", action: :purpose },
        { title: "Schedule", action: :schedule }
      ]
    }, {
      title: "Other Reference",
      cells: [
        { title: "Suffixes", action: :suffixes },
        { title: "SIG Codes", action: :sig_codes }
      ]
    }]
  end

  def brands
    open_screen BrandsScreen, hide_tab_bar: true
  end

  def generics
    open_screen GenericsScreen, hide_tab_bar: true
  end

  def purpose
    open_screen PurposeScreen, hide_tab_bar: true
  end

  def schedule
    open_screen ScheduleScreen, hide_tab_bar: true
  end

  def suffixes
    open_screen SuffixesScreen, hide_tab_bar: true
  end

  def sig_codes
    open_screen SigCodesScreen, hide_tab_bar: true
  end

end
