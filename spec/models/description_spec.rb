require 'rails_helper'

describe Description do
  it { should belong_to(:request)}
  it { should belong_to(:user)}
  it { should validate_presence_of :status
  it { should validate_presence_of :content}
end