require_relative '../test_helper'

class UserCanSeeAllRobotsTest < FeatureTest

  def test_user_can_see_all_robots
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
    # When I visit the dashboard
    visit "/"
    # And I click on "Robots"
    click_on "Robots"
    # Then I should see the robots created
    assert page.has_css?(".robot-list")
    assert page.has_css?(".img-rounded")
    assert_equal "/robots", current_path
end

end
