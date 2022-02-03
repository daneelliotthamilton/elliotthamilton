require "application_system_test_case"

class PracticeAreasTest < ApplicationSystemTestCase
  setup do
    @practice_area = practice_areas(:one)
  end

  test "visiting the index" do
    visit practice_areas_url
    assert_selector "h1", text: "Practice areas"
  end

  test "should create practice area" do
    visit practice_areas_url
    click_on "New practice area"

    fill_in "Title", with: @practice_area.title
    click_on "Create Practice area"

    assert_text "Practice area was successfully created"
    click_on "Back"
  end

  test "should update Practice area" do
    visit practice_area_url(@practice_area)
    click_on "Edit this practice area", match: :first

    fill_in "Title", with: @practice_area.title
    click_on "Update Practice area"

    assert_text "Practice area was successfully updated"
    click_on "Back"
  end

  test "should destroy Practice area" do
    visit practice_area_url(@practice_area)
    click_on "Destroy this practice area", match: :first

    assert_text "Practice area was successfully destroyed"
  end
end
