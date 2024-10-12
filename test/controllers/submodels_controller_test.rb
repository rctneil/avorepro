require "test_helper"

class SubmodelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submodel = submodels(:one)
  end

  test "should get index" do
    get submodels_url
    assert_response :success
  end

  test "should get new" do
    get new_submodel_url
    assert_response :success
  end

  test "should create submodel" do
    assert_difference("Submodel.count") do
      post submodels_url, params: { submodel: { model_id: @submodel.model_id, name: @submodel.name } }
    end

    assert_redirected_to submodel_url(Submodel.last)
  end

  test "should show submodel" do
    get submodel_url(@submodel)
    assert_response :success
  end

  test "should get edit" do
    get edit_submodel_url(@submodel)
    assert_response :success
  end

  test "should update submodel" do
    patch submodel_url(@submodel), params: { submodel: { model_id: @submodel.model_id, name: @submodel.name } }
    assert_redirected_to submodel_url(@submodel)
  end

  test "should destroy submodel" do
    assert_difference("Submodel.count", -1) do
      delete submodel_url(@submodel)
    end

    assert_redirected_to submodels_url
  end
end
