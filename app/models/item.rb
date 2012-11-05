class Item < ActiveRecord::Base
  attr_accessible :description, :price

  has_many   :orders
  belongs_to :merchant
end