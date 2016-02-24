require 'test_helper'

class UserRegistersForToolChestTest < FeatureTest
  test "user can register for Tool Chest" do
    visit '/'

    click_on 'Signup'

    fill_in 'Name', with: 'Nick'
    fill_in 'Username', with: 'nweiland'
    fill_in 'Password', with: 'password'

    click_on 'Signin'

    user = User.last
    assert_equal "/users/#{user.id}", current_path

    assert page.has_content?('Hey Nick')
  end
end
