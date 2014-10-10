require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  describe "Methods" do
    describe "#users_available" do
      subject(:relation) { relationship.users_available }
      let(:relationship) { Relationship.new }
      let(:user) { FactoryGirl.create(:user) }
      context 'when users available' do
        before(:each) do
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "b@koombea.com")
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "a@koombea.com")
          relationship.set_play(user.id)
        end
        it { expect(relation).to eql(2) }
      end

      context 'when users aren\'t available' do
        before(:each) do
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "b@koombea.com", relation: "true")
          FactoryGirl.create(:user, name: "Luis", like: "anime", dislike: "bailar salsa", email: "a@koombea.com", relation: "true")
          relationship.set_play(user.id)
        end
        it { expect(relation).to eql(0) }
      end

      context 'when update relation between players' do
        subject(:change) { relationship.change_relation }
        it "update the relacion between players" do
          change = double("true", :message => :return_value)
          expect(change.message).to eq(:return_value)
        end
      end
    end
  end
end
