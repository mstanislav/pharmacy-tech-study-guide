class SuffixesScreen < ProMotion::TableScreen
  title "Drug Suffixes"

  def table_data
    data = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'suffixes.txt')).split("\n").sort.each do |suffix|
      suffix, definition = suffix.split("\t")
      data << {title: suffix, subtitle: definition, cellStyle: UITableViewCellStyleSubtitle}
    end

    return [{ cells: data }]
  end

end
