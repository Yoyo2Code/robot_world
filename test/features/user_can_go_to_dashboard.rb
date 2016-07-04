require_relative '../test_helper'

class UserCanGoToDashboard < FeatureTest

  def test_user_can_create_a_task
    # As a user
    # When I visit the dashboard
    visit "/"
    # And I wait for it to load
    # Then I should see the dashboard page
    assert page.has_content?("Welcome to Robot World")
    assert page.has_css?("#greeting")
  end
end
