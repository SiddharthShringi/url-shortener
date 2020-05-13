require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

  test "should be able to create link" do
    assert_difference 'Link.count', 1 do
      post links_path, params: { link: { url: "https://bigbinary.com/products" }}
    end
    assert_response :ok

  end

  test "should not create link if it already exist?" do
    assert_difference 'Link.count', 0 do
      post links_path, params: { link: { url: links(:one).url }}
    end
    assert_response :ok
    assert_equal json_body["short_url"], links(:one).short_url
  end

  test "should show original url" do
    get short_url_path(links(:one).short_url)
    assert_response :ok
    assert_equal links(:one).url, json_body["url"]
  end

end
