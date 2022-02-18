require 'rails_helper'

describe User do
  it { should have_many(:descriptions)}
  it { should have_many(:requests)}
end