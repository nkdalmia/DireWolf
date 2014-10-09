require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "can not create another category with same name" do
    assert get_new_category_object.save!, "not able to create a category"
    assert_not get_new_category_object.save, "able to create another category with same name"
  end

  def get_new_category_object
    Category.new(:name => 'Test Category')
  end
end
