require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def new_user(attributes = {})
    attributes[:vzs_id] = '080'
    user = User.create(attributes)
    user.valid? # run validations
    user
  end
  def setup
    new_user
  end

  should_validate_presence_of :vzs_id
  should_validate_uniqueness_of :vzs_id

end

