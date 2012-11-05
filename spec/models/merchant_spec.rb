require 'spec_helper'

describe Merchant do
  it { should have_many(:items) }
  it { should have_many(:orders).through(:items) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:address) }
end