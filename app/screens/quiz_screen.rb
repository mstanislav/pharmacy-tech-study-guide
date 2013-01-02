class QuizScreen < ProMotion::Screen
  attr_accessor :type
  title "Quiz"
   
  def on_opened
    set_tab_bar_item title: "Quiz", icon: "quiz.png"
  end

  def on_load
    view.backgroundColor = UIColor.whiteColor

    @margin = 10
    @total = 10
    @index = 0

    @question_label = UILabel.new
    @question_label.font = UIFont.systemFontOfSize(20)
    @question_label.backgroundColor = UIColor.clearColor
    @question_label.textAlignment = UITextAlignmentCenter
    @question_label.frame = [[5, 20], [view.frame.size.width - 5 * 2, 35]]
    view.addSubview @question_label

    @answer_button_1 = add_answer(1) 
    @answer_button_2 = add_answer(2) 
    @answer_button_3 = add_answer(3) 
    @answer_button_4 = add_answer(4) 

    @result_label = UILabel.new
    @result_label.font = UIFont.systemFontOfSize(12)
    @result_label.backgroundColor = UIColor.clearColor
    @result_label.textAlignment = UITextAlignmentCenter
    @result_label.frame = [[@margin, 320], [view.frame.size.width - @margin * 2, 30]]
    view.addSubview @result_label

    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(30)
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.frame = [[120, 360], [80, 30]]
    view.addSubview @score_label

    reset_quiz

    get_question
  end

private
  def questions(total)
    questions = [{'question' => '', 'answer' => ''}]

    case
      when self.type.match(/(brand|generic|purpose)/)
        while questions.size-1 < total 
          brand, generic, purpose, schedule = drug_data.shuffle.first.split("\t")
          questions << {'question' => brand, 'answer' => generic} if self.type == 'brand_to_generic'
          questions << {'question' => brand, 'answer' => purpose} if self.type == 'brand_to_purpose'
          questions << {'question' => generic, 'answer' => brand} if self.type == 'generic_to_brand'
          questions << {'question' => generic, 'answer' => purpose} if self.type == 'generic_to_purpose'
        end
      when
        self.type.match(/abbr/)
          while questions.size-1 < total 
            code, definition = abbr_data.shuffle.first.split("\t")
            questions << {'question' => code, 'answer' => definition} if self.type == 'abbr_to_abbrdef'
            questions << {'question' => definition, 'answer' => code} if self.type == 'abbrdef_to_abbr'
          end
      when
        self.type.match(/suffix/)
          while questions.size-1 < total 
            suffix, definition = suffix_data.shuffle.first.split("\t")
            questions << {'question' => suffix, 'answer' => definition} if self.type == 'suffix_to_suffixdef'
            questions << {'question' => definition, 'answer' => suffix} if self.type == 'suffixdef_to_suffix'
          end
    end

    return questions
  end

  def add_answer(number)
    answer = UIButton.buttonWithType UIButtonTypeRoundedRect
    answer.setTitle('', forState:UIControlStateNormal)
    answer.addTarget(self, action:'show_answer:', forControlEvents:UIControlEventTouchUpInside)
    answer.frame = [[@margin, (view.frame.size.height / 200) + 20 + (60*number)], [view.frame.size.width - @margin * 2, 40]]
    view.addSubview answer
    return answer
  end

  def answers(correct)
    answers = [correct]

    case 
      when self.type.match(/(brand|generic|purpose)/)
        while answers.size < 4
          brand, generic, purpose, schedule = drug_data.shuffle.first.split("\t")
          answers << generic if self.type =~ /generic$/
          answers << brand if self.type =~ /brand$/
          answers << purpose if self.type =~ /purpose$/
        end
      when self.type.match(/abbr/)
        while answers.size < 4
          code, definition = abbr_data.shuffle.first.split("\t")
          answers << definition if self.type =~ /abbrdef$/
          answers << code if self.type =~ /abbr$/
        end
      when self.type.match(/suffix/)
        while answers.size < 4
          suffix, definition = suffix_data.shuffle.first.split("\t")
          answers << definition if self.type =~ /suffixdef$/
          answers << suffix if self.type =~ /suffix$/
        end
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

    if @index == @total
      show_alert('Quiz Complete', "Your final score was #{@score}/#{@total}", 'OK')
    else
      get_question
    end
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
    alert.delegate = self
    alert.title = title
    alert.message = message
    alert.addButtonWithTitle(button)
    alert.show
  end

  def alertView(alertView, didDismissWithButtonIndex: indexPath)
    reset_quiz
    get_question
  end

  def drug_data
    return File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n")
  end

  def abbr_data
    return File.read(File.join(NSBundle.mainBundle.resourcePath, 'abbreviations.txt')).split("\n")
  end

  def suffix_data
    return File.read(File.join(NSBundle.mainBundle.resourcePath, 'suffixes.txt')).split("\n")
  end

end
