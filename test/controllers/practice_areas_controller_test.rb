require "test_helper"

class PracticeAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice_area = practice_areas(:one)
  end

  test "should get index" do
    get practice_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_practice_area_url
    assert_response :success
  end

  test "should create practice_area" do
    assert_difference("PracticeArea.count") do
      post practice_areas_url, params: { practice_area: { title: @practice_area.title } }
    end

    assert_redirected_to practice_area_url(PracticeArea.last)
  end

  test "should show practice_area" do
    get practice_area_url(@practice_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_practice_area_url(@practice_area)
    assert_response :success
  end

  test "should update practice_area" do
    patch practice_area_url(@practice_area), params: { practice_area: { title: @practice_area.title } }
    assert_redirected_to practice_area_url(@practice_area)
  end

  test "should destroy practice_area" do
    assert_difference("PracticeArea.count", -1) do
      delete practice_area_url(@practice_area)
    end

    assert_redirected_to practice_areas_url
  end
end
