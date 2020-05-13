require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

  test "should be able to create link" do
    assert_difference 'Link.count', 1 do
      post links_path, params: { link: { url: "https://bigbinary.com/carrer" }}
    end
    assert_response :ok
  end

  test "should show original url" do
    get short_url_path(links(:one).short_url)
    assert_response :ok
    assert_equal "https://bigbinary.com/jobs", json_body["url"]
  end

end
