require_relative '../test_helper'

class UserCanDestroyARobotTest < FeatureTest

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
  # When I see all the robots
  visit "/robots"
  # And I click the link "delete robot"
  click_on "Delete Robot"
  # Then I should be on the robot list page with the robot deleted
  assert_equal "/robots", current_path
  # tests if there is an image which represents  arobot
  refute page.has_css?(".img-rounded")
end

end
