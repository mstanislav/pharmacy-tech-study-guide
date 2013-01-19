class LawScreen < ProMotion::Screen
  attr_accessor :value
  title "Law"

  def on_load                                                                                                            
    scroll = UIScrollView.new
    view.backgroundColor = UIColor.whiteColor                                                                            

    get_content(value)

    title = UILabel.new                                                                                        
    title.font = UIFont.systemFontOfSize(22)                                                                   
    title.backgroundColor = UIColor.clearColor                                                                 
    title.lineBreakMode = UILineBreakModeWordWrap                                                              
    title.numberOfLines = 0 
    title.frame = [[5, 5], [300, 60]]                                               
    title.text = @title
    title.sizeToFit
    view.addSubview title                                                                                      
                                                                                                                         
    content = UILabel.new                                                                                          
    content.font = UIFont.systemFontOfSize(14)                                                                     
    content.backgroundColor = UIColor.clearColor                                                                   
    content.lineBreakMode = UILineBreakModeWordWrap                                                             
    content.numberOfLines = 0 
    content.frame = [[5, 80], [300, 400]]
    content.text = @string
    content.sizeToFit
    view.addSubview content                                                                                        
  end                                      

private
  def get_content(value)
    File.read(File.join(NSBundle.mainBundle.resourcePath, 'law.txt')).split("\n").each do |law|                          
      @type, @title, @content = law.split("\t")                                                                             
      if value == @title
        @string = ''
        @content.split(':::').each do |major|
          if major =~ /;;;/
          @string += "\u2022 #{major.split(';;;').first}\n"
            major.split(';;;')[1..-1].each do |minor|
              @string += "\t\t\u2022 #{minor}\n" 
            end
            @string += "\n"
          else
            @string += "\u2022 #{major}\n\n"
          end
        end
        return true
      end
    end         
  end
end
