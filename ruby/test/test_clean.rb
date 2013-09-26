require "minitest/autorun"
require "fileutils"

require "filecleaner"

class TestClean < MiniTest::Test

  def test_remove
    assert_equal "Hello", "Hello2"
  end

end
