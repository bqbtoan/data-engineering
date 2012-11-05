require 'spec_helper'

# Just a quick and dirty to validated the solution
describe OrdersImporter do
  describe '.run!' do
    let (:fixture) {File.new("#{Rails.root}/spec/fixtures/example_input.tab")}

    it 'should import the file' do
      OrdersImporter.run!(fixture).should == 95.0
      customer_counts
      merchant_counts
    end

    def customer_counts
      Customer.all.count.should == 3
      Customer.all.each do |customer|
        order_count = case customer.name
          when 'Snake Plissken' ; 2
          when 'Amy Pond'       ; 1
          when 'Marty McFly'    ; 1
        end
        customer.orders.count.should == order_count
      end
    end

    def merchant_counts
      Merchant.all.count.should == 3
      Merchant.all.each do |merchant|
        item_count, order_count = case merchant.name
          when "Bob's Pizza"            ; [1, 1]
          when "Tom's Awesome Shop"     ; [1, 1]
          when "Sneaker Store Emporium" ; [1, 2]
        end
        merchant.items.count.should  == item_count
        merchant.orders.count.should == order_count
      end
    end
  end
end