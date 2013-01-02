class MathFormulasScreen < ProMotion::TableScreen
  title "Math Formulas"

  def table_data
    data = Array.new

    File.read(File.join(NSBundle.mainBundle.resourcePath, 'math_formulas.txt')).split("\n").each do |formula|
      name, math = formula.split("\t")
      data << {title: name, subtitle: math, cellStyle: UITableViewCellStyleSubtitle}
    end

    return [{ cells: data }]
  end

end
