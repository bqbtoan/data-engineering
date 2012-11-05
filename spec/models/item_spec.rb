require 'spec_helper'

describe Item do
  it { should belong_to(:merchant) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:price) }
end