require 'rails_helper'

describe Request do
  it { should have_many(:descriptions)}
  it { should belong_to(:user)}
  it { should validate_presence_of :status
  it { should validate_presence_of :content}
end