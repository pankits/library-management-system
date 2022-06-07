require 'test_helper'

class BookissuesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bookissues_index_url
    assert_response :success
  end

end
