require 'spec_helper'

describe Order do
  it { should belong_to(:customer) }
  it { should belong_to(:item) }
  it { should allow_mass_assignment_of(:item) }
  it { should allow_mass_assignment_of(:count) }
end