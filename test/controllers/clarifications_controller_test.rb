require 'test_helper'

class ClarificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clarification = clarifications(:one)
  end

  test "should get index" do
    get clarifications_url, as: :json
    assert_response :success
  end

  test "should create clarification" do
    assert_difference('Clarification.count') do
      post clarifications_url, params: { clarification: { selection: @clarification.selection, state: @clarification.state, url: @clarification.url } }, as: :json
    end

    assert_response 201
  end

  test "should show clarification" do
    get clarification_url(@clarification), as: :json
    assert_response :success
  end

  test "should update clarification" do
    patch clarification_url(@clarification), params: { clarification: { selection: @clarification.selection, state: @clarification.state, url: @clarification.url } }, as: :json
    assert_response 200
  end

  test "should destroy clarification" do
    assert_difference('Clarification.count', -1) do
      delete clarification_url(@clarification), as: :json
    end

    assert_response 204
  end
end
