require 'test_helper'

class AdminUsersTest < FeatureTest

  test 'logged in admin can delete users but cannot edit them and is not show on index' do
    User.create(username: "default",
                name: "Default",
                password: "password",
                role: 0)
    admin = User.create(username: "admin",
                        name: "Admin",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_users_path
    assert page.has_content?("default")

    click_on "default"

    assert page.has_content?("Delete")
    refute page.has_content?("Edit")

    click_on "Delete"
    assert_equal admin_users_path, current_path
    refute page.has_content?("Default")
  end
end
