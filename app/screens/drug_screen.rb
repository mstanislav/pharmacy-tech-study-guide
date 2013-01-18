class DrugScreen < ProMotion::GroupedTableScreen
  attr_accessor :brand, :generic, :purpose, :schedule
  title "Drug Detail"

  def on_load
    view.backgroundColor = UIColor.whiteColor
  end

 def table_data
    [ { title: "Brand Name", cells: [ { title: brand, fontResize: true } ] },
      { title: "Generic Name", cells: [ { title: generic, fontResize: true } ] }, 
      { title: "Purpose", cells: [ { title: purpose } ] },
      { title: "Schedule", cells: [ { title: schedule } ] } ]
  end
end
