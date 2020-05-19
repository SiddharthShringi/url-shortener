require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest

  test "should be able to encode a link" do
    assert_difference 'Link.count', 1 do
      post encode_api_v1_links_path, params: { link: { url: "https://bigbinary.com/products" }}
    end
    assert_response :ok

  end

  test "should not encode link if it already exist?" do
    assert_difference 'Link.count', 0 do
      post encode_api_v1_links_path, params: { link: { url: links(:one).url }}, as: :json
    end
    assert_response :ok
    assert_equal json_body["short_url"], links(:one).short_url
  end

  test "should show original url" do
    get decode_api_v1_link_path(links(:one).short_url)
    assert_response :ok
    assert_equal links(:one).url, json_body["url"]
  end

end
