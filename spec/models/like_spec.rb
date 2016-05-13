require 'rails_helper'

describe Like do
  describe 'association' do
    let(:like) { create(:like) }
    it 'should be associated with a prototype' do
      expect(like.prototype).to be_present
    end

    it 'should be associated with a user' do
      expect(like.user).to be_present
    end
  end
end
