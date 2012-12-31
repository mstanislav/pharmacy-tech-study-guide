class BrandsScreen < ProMotion::SectionedTableScreen
  title "Brand Names"

  def table_data
    data = Array.new

    ("A".."Z").each do |letter|
      data << { title: "#{letter}", cells: cells("#{letter}") }
    end

    return data
  end

  def table_data_index
    return ("A".."Z").to_a
  end

  def cells(letter)
    drugs = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").sort.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      drugs << {title: brand, action: :show_drug} if brand[0] == letter
    end

    return drugs
  end
end
