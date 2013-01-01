class QuizMenuScreen < ProMotion::GroupedTableScreen
  title "Quizzes"

  def on_opened
    set_tab_bar_item title: "Quiz", icon: "quiz.png"
  end

  def table_data
    [{
      title: "Brand Name Drugs",
      cells: [
        { title: "Brand Name to Generic Name", action: :quiz, arguments: { type: 'brand_to_generic' } },
        { title: "Brand Name to Purpose", action: :quiz, arguments: { type: 'brand_to_purpose' } }
      ]
    }, {
      title: "Generic Name Drugs",
      cells: [
        { title: "Generic Name to Brand Name", action: :quiz, arguments: { type: 'generic_to_brand' } },
        { title: "Generic Name to Purpose", action: :quiz, arguments: { type: 'generic_to_purpose' } }
      ]
    }, {
      title: "Sig Codes",
      cells: [
        { title: "Sig Code to Definition", action: :quiz, arguments: { type: 'sig_to_sigdef' } },
        { title: "Definition to Sig Code", action: :quiz, arguments: { type: 'sigdef_to_sig' } }
      ] 
    }, {
      title: "Suffixes",
      cells: [
        { title: "Suffix to Definition", action: :quiz, arguments: { type: 'suffix_to_suffixdef' } },
        { title: "Definition to Suffix", action: :quiz, arguments: { type: 'suffixdef_to_suffix' } }
      ] 
    }]
  end

  def quiz(arguments)
    open_screen QuizScreen.new(type: arguments[:type]), hide_tab_bar: true
  end

end
