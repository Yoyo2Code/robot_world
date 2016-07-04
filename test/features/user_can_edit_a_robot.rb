require_relative '../test_helper'

class UserCanEditARobotTest < FeatureTest

  def test_user_can_create_a_task
    visit "/"
    click_on "New Robot"
    fill_in "robot[name]", with: "Bob"
    fill_in "robot[city]", with: "Denver"
    fill_in "robot[state]", with: "Colorado"
    fill_in "robot[birthdate]", with: "01/09/1990"
    fill_in "robot[date_hired]", with: "01/15/2014"
    fill_in "robot[department]", with: "Developer"
    click_on "Create Robot"

    # As a user
    # When I have a created robot
    assert_equal "/robots", current_path
    # And I click on "edit"
    click_on "Edit"
    # And I fill in new information
    fill_in "robot[name]", with: "Bob"
    fill_in "robot[city]", with: "Denver"
    fill_in "robot[state]", with: "Colorado"
    fill_in "robot[birthdate]", with: "01/09/1990"
    fill_in "robot[date_hired]", with: "01/15/2014"
    fill_in "robot[department]", with: "Developer"
    click_on "Update Robot"
    click_on "Return Home"
    # Then it should redirect me to the index page
    assert_equal "/robots", current_path
end

end
