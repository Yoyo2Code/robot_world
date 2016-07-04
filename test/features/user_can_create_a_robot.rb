require_relative '../test_helper'

class UserCanCreateARobotTest < FeatureTest

  def test_user_can_create_a_task
    # As a user
    # When I visit the dashboard
    visit "/"
    # And I click on "New Robot"
    click_on "New Robot"
    # Then I should be on the new robot forum page
    assert_equal "/robots/new", current_path


    # And I fill in the name field with "Bob"
    fill_in "robot[name]", with: "Bob"
    # And I fill in the city field with "Denver"
    fill_in "robot[city]", with: "Denver"
    # And I fill in the state field with "Colorado"
    fill_in "robot[state]", with: "Colorado"
    # And I fill in the birthdate field with "01/09/1990"
    fill_in "robot[birthdate]", with: "01/09/1990"
    # And I fill in the date hired field with "01/15/2014"
    fill_in "robot[date_hired]", with: "01/15/2014"
    # And I fill in the department field with "Developer"
    fill_in "robot[department]", with: "Developer"
    # And I click the create robot button
    click_on "Create Robot"

    assert_equal "/robots", current_path
    # Then I should see the list of robots
    assert page.has_css?(".img-rounded")
    assert page.has_css?(".robot-list")
  end
end
