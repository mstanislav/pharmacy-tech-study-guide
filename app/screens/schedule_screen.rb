class ScheduleScreen < ProMotion::SectionedTableScreen
  title "Drugs by Schedule"

  def table_data
    data = Array.new

    ['2','3','4','6'].each do |value|
      data << { title: "Schedule #{value}", cells: cells("#{value}") }
    end

    return data
  end

  def table_data_index
    return ['2','3','4','6']
  end

  def cells(value)
    drugs = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").sort.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      drugs << {title: brand, subtitle: generic, font_resize: true, cellStyle: UITableViewCellStyleSubtitle, action: :show_drug,
                arguments: { brand: brand, generic: generic, purpose: purpose, schedule: schedule } } if schedule == value
    end

    return drugs
  end

  def show_drug(a)
    open_screen DrugScreen.new(brand: a[:brand], generic: a[:generic], purpose: a[:purpose], schedule: a[:schedule])
  end
end
