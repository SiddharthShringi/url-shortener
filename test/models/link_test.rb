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

  test "short_url should be unique" do
    @link.short_url = links(:one).short_url
    assert_not @link.valid?
    assert_equal ["Short url has already been taken"], @link.errors.full_messages
  end

  test "short_url should be 8 character" do
    @link.short_url = "TPMHWCBKHPY"
    assert_not @link.valid?
    assert_equal ["Short url is the wrong length (should be 8 characters)"], @link.errors.full_messages
  end
end
