class InfoScreen < ProMotion::Screen
  title "Info"

  def on_opened
    set_tab_bar_item title: "Info", icon: "info.png"
  end

  def on_load                                                                                                            
    title = UILabel.new                                                                                        
    title.font = UIFont.systemFontOfSize(22)                                                                   
    title.textColor = UIColor.whiteColor
    title.backgroundColor = UIColor.clearColor                                                                 
    title.lineBreakMode = UILineBreakModeWordWrap                                                              
    title.textAlignment = NSTextAlignmentCenter
    title.numberOfLines = 0 
    title.frame = [[5, 5], [315, 30]]                                               
    title.text = "Disclaimer"

    view.addSubview title
                                                                                                                         
    content = UILabel.new                                                                                          
    content.font = UIFont.systemFontOfSize(14)                                                                     
    content.textColor = UIColor.whiteColor
    content.backgroundColor = UIColor.clearColor                                                                   
    content.lineBreakMode = UILineBreakModeWordWrap                                                             
    content.numberOfLines = 0 
    content.frame = [[5, 40], [315, 100]]
    content.text =  "The contents and use of this app are meant for informational and entertainment purposes only. "
    content.text += "No guarantee regarding the accuracy of the included contents is express or implied.\n\n" 
    content.text += "Usage of this app for medical reference is not recommended and may be dangerous.\n\n"
    content.text += "Using this app does not guarantee success when taking your PTCB exam.\n\n"
    content.text += "All rights to the names of drugs and terms found within this app are those of their respective owners.\n\n"
    content.text += "That all being said, we hope that you find this app useful and wish you the best of luck on your future exam!\n\n"
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
