class Order < ActiveRecord::Base
  attr_accessible :count, :item

  belongs_to :customer
  belongs_to :item
end