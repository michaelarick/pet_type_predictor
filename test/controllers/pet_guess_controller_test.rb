require 'test_helper'

class PetGuessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pet_guess_index_url
    assert_response :success
  end

end
