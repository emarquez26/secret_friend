require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  describe "Methods" do
    describe "#user_player" do
      before(:each) do
        users
      end
      let(:users) { FactoryGirl.create(:user) }
      let(:user_relation) { User.users_available(users)}
      let(:users_available) {Relationship.new.users_available }
      let(:user_rand) { rand(1..5) }
      context 'when users available' do
        before(:each) do
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "b@koombea.com")
        end
        it { expect(user_relation).not_to be_empty }
      end

      context 'when not users available' do
        before(:each) do
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "b@koombea.com", relation: "true") 
        end
        it { expect(user_relation).to be_empty }
      end

    end
  end
end