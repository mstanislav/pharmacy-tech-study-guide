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
      drugs << {title: brand, subtitle: generic, fontResize: true, cellStyle: UITableViewCellStyleSubtitle, action: :show_drug, 
                arguments: { brand: brand, generic: generic, purpose: purpose, schedule: schedule } } if purpose == type
    end

    return drugs
  end

  def show_drug(a)
    open_screen DrugScreen.new(brand: a[:brand], generic: a[:generic], purpose: a[:purpose], schedule: a[:schedule])
  end
end
