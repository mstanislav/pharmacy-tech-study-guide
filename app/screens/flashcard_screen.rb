class FlashCardScreen < ProMotion::Screen
  attr_accessor :type
  title "Flashcards"
   
  def on_opened
    set_tab_bar_item title: "Flashcards", icon: "flashcard.png"
  end

  def on_load
    view.backgroundColor = UIColor.whiteColor
    setup_gestures
  end

private
  def setup_gestures
    @swipeLeftRecognizer = UISwipeGestureRecognizer.new.initWithTarget(self, action:'handleLeftSwipeFrom:')
    @swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionLeft
    @swipeRightRecognizer = UISwipeGestureRecognizer.new.initWithTarget(self, action:'handleRightSwipeFrom:')
    @swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight
    view.addGestureRecognizer(@swipeLeftRecognizer)
    view.addGestureRecognizer(@swipeRightRecognizer)
  end
  
  def handleLeftSwipeFrom(recognizer)
    p 'right to left'
  end

  def handleRightSwipeFrom(recognizer)
    p 'left to right'
  end
end
