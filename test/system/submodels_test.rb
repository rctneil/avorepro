require "application_system_test_case"

class SubmodelsTest < ApplicationSystemTestCase
  setup do
    @submodel = submodels(:one)
  end

  test "visiting the index" do
    visit submodels_url
    assert_selector "h1", text: "Submodels"
  end

  test "should create submodel" do
    visit submodels_url
    click_on "New submodel"

    fill_in "Model", with: @submodel.model_id
    fill_in "Name", with: @submodel.name
    click_on "Create Submodel"

    assert_text "Submodel was successfully created"
    click_on "Back"
  end

  test "should update Submodel" do
    visit submodel_url(@submodel)
    click_on "Edit this submodel", match: :first

    fill_in "Model", with: @submodel.model_id
    fill_in "Name", with: @submodel.name
    click_on "Update Submodel"

    assert_text "Submodel was successfully updated"
    click_on "Back"
  end

  test "should destroy Submodel" do
    visit submodel_url(@submodel)
    click_on "Destroy this submodel", match: :first

    assert_text "Submodel was successfully destroyed"
  end
end
