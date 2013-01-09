class ReferenceScreen < ProMotion::GroupedTableScreen
  title "Reference"

  def on_appear
    @reference  ||= ReferenceScreen.new(nav_bar: true)
    @quiz       ||= QuizMenuScreen.new(nav_bar: true)
    @law        ||= LawScreen.new(nav_bar: true)
    @tab_bar    ||= open_tab_bar @reference, @quiz, @law
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
      title: "General",
      cells: [
        { title: "Drug Suffixes", action: :suffixes },
        { title: "Abbreviations", action: :abbreviations },
      ]
    }, {
      title: "Math",
      cells: [
        { title: "Formulas", action: :math_formulas },
        { title: "Conversions", action: :measurement_conversions }
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

  def abbreviations
    open_screen AbbreviationsScreen, hide_tab_bar: true
  end

  def math_formulas
    open_screen MathFormulasScreen, hide_tab_bar: true
  end

  def measurement_conversions
    open_screen MeasurementConversionsScreen, hide_tab_bar: true
  end

end
