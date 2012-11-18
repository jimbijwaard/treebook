require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:jim).profile_name
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user sould have a profile name without spaces" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason@gmail.com')
    user.password = user.password_confirmation = 'adsafadsaf'

    user.profile_name = "My profile name"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly.")
  end

  test "a user porfile should only contain letters and numbers" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason@gmail.com')
    user.password = user.password_confirmation = 'adsafadsaf'

    user.profile_name = "jasonseifer_1"
    assert user.valid?
  end

end


