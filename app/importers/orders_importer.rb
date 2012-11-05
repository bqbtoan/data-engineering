require 'csv'

class OrdersImporter
  def self.run!(file)
    self.new.import file
  end

  def import(file)
    revenue = 0;
    CSV.parse(file, parse_opts) do |row|
      revenue += RowProcessor.new.process(row.to_hash)
    end
    revenue
  end

  def parse_opts
    {
      :col_sep           => "\t",
      :converters        => :numeric,
      :headers           => true,
      :header_converters => :symbol
    }
  end

  class RowProcessor
    FIELDS = [
      :merchant_name,
      :merchant_address,
      :purchaser_name,
      :item_description,
      :item_price,
      :purchase_count
    ]

    FIELDS.each {|field| define_method(field) { @row[field] }}

    def process(row)
      @row = row
      customer.orders.create! item: item, count: purchase_count
      item_price * purchase_count
    end

    def merchant
      Merchant.find_or_create_by_name_and_address merchant_name, merchant_address
    end

    def customer
      Customer.find_or_create_by_name purchaser_name
    end

    def item
      merchant.items.find_or_create_by_description_and_price item_description, item_price
    end
  end
end