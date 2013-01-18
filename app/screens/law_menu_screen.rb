class LawMenuScreen < ProMotion::GroupedTableScreen                                                                     
  title "Pharmacy Law"                                                                                                        
                                                                                                                         
  def on_opened                                                                                                          
    set_tab_bar_item title: "Law", icon: "law.png"                                                                     
  end                                                                                                                    
                                                                                                                         
  def table_data                                                                                                         
    data = {  'Acts' => Array.new, 'Laws' => Array.new, 'Process' => Array.new, 'Amendments' => Array.new, 
              'Definitions' => Array.new, 'Schedules' => Array.new }

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'law.txt')).split("\n").each do |law| 
      type, title, content = law.split("\t")                                                                                   
      data[type] << { title: title, action: :law, fontResize: true, arguments: { value: title } }
    end                                                                                                                  

    return [ { title: "Acts", cells: data["Acts"] },
             { title: "Laws", cells: data["Laws"] },
             { title: "Amendments", cells: data["Amendments"] },
             { title: "Process", cells: data["Process"] },
             { title: "Schedules", cells: data["Schedules"] },
             { title: "Definitions", cells: data["Definitions"] } ]
  end                                                                                                                    
                                                                                                                         
  def law(arguments)                                                                                                    
    open_screen LawScreen.new(value: arguments[:value]), hide_tab_bar: true                                               
  end                                                                                                                    
                                                                                                                         
end 
