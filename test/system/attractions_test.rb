require "application_system_test_case"

class AttractionsTest < ApplicationSystemTestCase
  setup do
    @attraction = attractions(:one)
  end

  test "visiting the index" do
    visit attractions_url
    assert_selector "h1", text: "Attractions"
  end

  test "should create attraction" do
    visit attractions_url
    click_on "New attraction"

    fill_in "Name", with: @attraction.name
    fill_in "Venue", with: @attraction.venue_id
    click_on "Create Attraction"

    assert_text "Attraction was successfully created"
    click_on "Back"
  end

  test "should update Attraction" do
    visit attraction_url(@attraction)
    click_on "Edit this attraction", match: :first

    fill_in "Name", with: @attraction.name
    fill_in "Venue", with: @attraction.venue_id
    click_on "Update Attraction"

    assert_text "Attraction was successfully updated"
    click_on "Back"
  end

  test "should destroy Attraction" do
    visit attraction_url(@attraction)
    click_on "Destroy this attraction", match: :first

    assert_text "Attraction was successfully destroyed"
  end
end
