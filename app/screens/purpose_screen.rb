class PurposeScreen < ProMotion::SectionedTableScreen
  title "Drugs by Purpose"

  def table_data
    data = Array.new

    types = Array.new
    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").sort.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      types << purpose unless types.include?(purpose)
    end

    types.sort.each do |type|
      data << { title: "#{type}", cells: cells("#{type}") }
    end

    return data
  end

  def cells(type)
    drugs = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").sort.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      drugs << {title: brand, subtitle: generic, font_resize: true, cellStyle: UITableViewCellStyleSubtitle, action: :show_drug} if purpose == type
    end

    return drugs
  end
end
