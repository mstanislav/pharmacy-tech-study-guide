class ScheduleScreen < ProMotion::SectionedTableScreen
  title "Drugs by Schedule"

  def table_data
    data = Array.new

    data << { title: "Schedule 1", cells: cells("1") }
    data << { title: "Schedule 2", cells: cells("2") }
    data << { title: "Schedule 3", cells: cells("3") }
    data << { title: "Schedule 4", cells: cells("4") }
    data << { title: "Schedule 5", cells: cells("5") }
    data << { title: "Non-Controlled", cells: cells("Non-Controlled") }

    return data
  end

  def table_data_index
    return ['1','2','3','4','5','NC']
  end

  def cells(value)
    drugs = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'drugs.txt')).split("\n").sort.each do |drug|
      brand, generic, purpose, schedule = drug.split("\t")
      drugs << {title: brand, subtitle: generic, fontResize: true, cellStyle: UITableViewCellStyleSubtitle, action: :show_drug,
                arguments: { brand: brand, generic: generic, purpose: purpose, schedule: schedule } } if schedule == value
    end

    return drugs
  end

  def show_drug(a)
    open_screen DrugScreen.new(brand: a[:brand], generic: a[:generic], purpose: a[:purpose], schedule: a[:schedule])
  end
end
