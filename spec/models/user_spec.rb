require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "update atributes" do 
    let(:user) { User.new }
    let(:search) { user.change_relation }
      before :each do 
        @id1=FactoryGirl.create(:user, relation: "false")
        @id2=FactoryGirl.create(:user, relation: "false")
      end 
    User.by_letter("false").should == [@id1,@id2]
  end
end