class AbbreviationsScreen < ProMotion::GroupedTableScreen
  title "Abbreviations"

  def table_data
    sig = Array.new
    measurement = Array.new
    general = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'abbreviations.txt')).split("\n").sort.each do |abbreviation|
      abbr, definition, type = abbreviation.split("\t")
      general << {title: abbr, subtitle: definition, cellStyle: UITableViewCellStyleSubtitle} if type == 'General'
      measurement << {title: abbr, subtitle: definition, cellStyle: UITableViewCellStyleSubtitle} if type == 'Measurement'
      sig << {title: abbr, subtitle: definition, cellStyle: UITableViewCellStyleSubtitle} if type == 'Sig'
    end

    return [{ title: 'General', cells: general }, { title: 'Measurement', cells: measurement }, { title: 'Sig Codes', cells: sig }]
  end

end
