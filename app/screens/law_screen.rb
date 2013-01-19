class LawScreen < ProMotion::Screen
  attr_accessor :value
  title "Law"

  def on_load                                                                                                            
    view.backgroundColor = UIColor.whiteColor                                                                            

    scroll = UIScrollView.new
    scroll.frame = [[5, 5], [315, 400]]

    get_content(value)

    title = UILabel.new                                                                                        
    title.font = UIFont.systemFontOfSize(22)                                                                   
    title.backgroundColor = UIColor.clearColor                                                                 
    title.lineBreakMode = UILineBreakModeWordWrap                                                              
    title.textAlignment = NSTextAlignmentCenter
    title.numberOfLines = 0 
    title.frame = [[0, 0], [310, 60]]                                               
    title.text = @title

    scroll.addSubview title
                                                                                                                         
    content = UILabel.new                                                                                          
    content.font = UIFont.systemFontOfSize(14)                                                                     
    content.backgroundColor = UIColor.clearColor                                                                   
    content.lineBreakMode = UILineBreakModeWordWrap                                                             
    content.numberOfLines = 0 
    content.frame = [[0, 65], [310, 100]]
    content.text = @string
    content.sizeToFit

    scroll.contentSize = CGSizeMake(scroll.contentSize.width, title.frame.size.height + content.frame.size.height)
    scroll.addSubview content

    view.addSubview scroll                                                                                      
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
