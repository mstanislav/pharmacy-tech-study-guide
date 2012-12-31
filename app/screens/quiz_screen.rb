class QuizScreen < ProMotion::Screen
  title "Quiz"

  def on_appear
    @reference  ||= ReferenceScreen.new(nav_bar: true)
    @quiz       ||= QuizScreen.new(nav_bar: true)
    @tab_bar    ||= open_tab_bar @reference, @quiz
  end

  def on_opened
    set_tab_bar_item title: "Quiz", icon: "quiz.png"
  end

  def on_load
    view.backgroundColor = UIColor.whiteColor

    @margin = 10
    @total = 10
    @index = 0

    @question_label = UILabel.new
    @question_label.font = UIFont.systemFontOfSize(30)
    @question_label.backgroundColor = UIColor.clearColor
    @question_label.textAlignment = UITextAlignmentCenter
    @question_label.frame = [[@margin, @margin], [view.frame.size.width - @margin * 2, 35]]
    view.addSubview @question_label

    @answer_button_1 = add_answer(1) 
    @answer_button_2 = add_answer(2) 
    @answer_button_3 = add_answer(3) 
    @answer_button_4 = add_answer(4) 

    @result_label = UILabel.new
    @result_label.font = UIFont.systemFontOfSize(12)
    @result_label.backgroundColor = UIColor.clearColor
    @result_label.textAlignment = UITextAlignmentCenter
    @result_label.frame = [[@margin, 285], [view.frame.size.width - @margin * 2, 30]]
    view.addSubview @result_label

    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(30)
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.frame = [[120, 325], [80, 30]]
    view.addSubview @score_label

    reset_quiz

    get_question
  end

private
  def questions(total)
    questions = [{'question' => '', 'answer' => ''}]

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").shuffle.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      questions << {'question' => brand, 'answer' => generic} unless questions.size-1 == total
    end

    return questions
  end

  def add_answer(number)
    answer = UIButton.buttonWithType UIButtonTypeRoundedRect
    answer.setTitle('', forState:UIControlStateNormal)
    answer.addTarget(self, action:'show_answer:', forControlEvents:UIControlEventTouchUpInside)
    answer.frame = [[@margin, view.frame.size.height / 200 + (60*number)], [view.frame.size.width - @margin * 2, 40]]
    view.addSubview answer
    return answer
  end

  def answers(correct)
    answers = [correct]

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").shuffle.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      answers << generic unless answers.size == 4 or answers.include?(generic)
    end

    return answers.shuffle
  end

  def show_answer(sender)
    if sender.titleForState(UIControlStateNormal) == @questions[@index]['answer']
      @score += 1 
      @result_label.text = "Correct!"
      @result_label.textColor = UIColor.greenColor 
    else
      @result_label.text = "Incorrect! The answer was #{@questions[@index]['answer']}"
      @result_label.textColor = UIColor.redColor 
    end

    @score_label.text = "#{@score}/#{@index}"

    final_score if @index == @total
    get_question
  end

  def get_question
    @index +=1
    @question_label.text = @questions[@index]['question']
    @answers = answers(@questions[@index]['answer'])
    @answer_button_1.setTitle(@answers[0], forState:UIControlStateNormal)
    @answer_button_2.setTitle(@answers[1], forState:UIControlStateNormal)
    @answer_button_3.setTitle(@answers[2], forState:UIControlStateNormal)
    @answer_button_4.setTitle(@answers[3], forState:UIControlStateNormal)
  end

  def final_score
    show_alert('Game Over', "Your final score was #{@score}/#{@total}", 'OK')
    reset_quiz
  end

  def reset_quiz
    @questions = questions(@total)
    @score = 0
    @index = 0
    @score_label.text = "0/0"
    @result_label.text = ""
    @result_label.textColor = UIColor.blackColor 
  end

  def show_alert(title, message, button)
    alert = UIAlertView.new
    alert.title = title
    alert.message = message
    alert.addButtonWithTitle(button)
    alert.show
  end

end
