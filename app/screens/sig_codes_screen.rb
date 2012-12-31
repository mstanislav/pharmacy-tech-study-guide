class SigCodesScreen < ProMotion::TableScreen
  title "Sig Codes"

  def table_data
    data = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'sig_codes.txt')).split("\n").sort.each do |sig|
      code, definition = sig.split("\t")
      data << {title: code, subtitle: definition, cellStyle: UITableViewCellStyleValue1}
    end

    return [{ cells: data }]
  end

end
