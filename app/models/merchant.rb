class Merchant < ActiveRecord::Base
  attr_accessible :name, :address
  has_many :items
  has_many :orders, through: :items
end