require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/users.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal User.count, data.length
  end

  test "create" do
    assert_difference "User.count", 1 do
      post "/users.json", params: { name: "Chloe", email: "chloe@test.com", password_digest: "password" }
      assert_response 200
    end
  end

  test "show" do
    get "/users/#{User.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "email", "password_digest", "created_at", "updated_at"], data.keys
  end
end
