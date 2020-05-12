require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  def setup
    @link = Link.new(url: "https://bigbinary.com")
  end
  
  test "url is valid" do
    assert @link.valid?
  end

  test "invalid url" do
    @link.url = "random-string"
    assert_not @link.valid?
    assert_equal ["Url is invalid"], @link.errors.full_messages
  end
end
