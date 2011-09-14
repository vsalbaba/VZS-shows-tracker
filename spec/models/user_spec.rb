require 'spec_helper'

describe User do
  it 'should have valid factory' do
    @user = Factory :user
    @user.should be_valid
  end
end

