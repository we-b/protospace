require 'rails_helper'

describe Comment do
  describe 'association' do
    let(:comment) { create(:comment) }
    it 'is associated with a prototype' do
      prototype = create(:prototype)
      comment = create(:comment, prototype: prototype)
      expect(comment.prototype).to eq prototype
    end
    
    it 'is associated with a user' do
      user = create(:user)
      comment = create(:comment, user: user)
      expect(comment.user).to eq user
    end
  end
end
