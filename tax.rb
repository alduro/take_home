class Tax
  @except_goods = ["chocolat", "book", "pills"]

  def self.calculate(item, price, tax_rate = 0.1)
    no_tax =  @except_goods.any? { |good| item.include?(good) }

    import_duty = item.include?("imported") ? 0.05 : 0
    tax = no_tax ? 0 : tax_rate

    total = tax + import_duty

    # byebug
    return (price * (1 + tax)).round(2) if import_duty == 0
    (price * (1 + total.round(2))).round(2)
    # ((price * (1 + total.round(2))) * 20).round / 20.0
  end
end

