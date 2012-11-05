require 'spec_helper'

describe Customer do
  it { should have_many(:orders) }
  it { should allow_mass_assignment_of(:name) }
end