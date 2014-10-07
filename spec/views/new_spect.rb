require 'rails_helper'

RSpec.describe "users/new", :type => :request do
  it "new form to save the user with (name,like and dislike)" do
    user = User.create(name: "person@koombea.com", like: "chocolate", dislike: "alcohol")
    get new_user_path(user)

    assert_select "form" do
      assert_select "input" do
        assert_select "input[name=?]", "user[name]"
        assert_select "input[type=?]", "submit"
      end
      assert_select "textarea" do
        assert_select "textarea", :name => "like"
        assert_select "textarea", :name => "dislike"
      end
    end
  end
end