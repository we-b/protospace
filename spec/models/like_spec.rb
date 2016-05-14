require 'rails_helper'

describe Like do
  describe 'association' do
    it 'is associated with a prototype' do
      prototype = create(:prototype)
      like = create(:like, prototype: prototype)
      expect(like.prototype).to eq prototype
    end

    it 'is associated with a user' do
      user = create(:user)
      like = create(:like, user: user)
      expect(like.user).to eq user
    end
  end
end
