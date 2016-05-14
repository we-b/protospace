require 'rails_helper'

describe UsersController do
  before { login_user }

  describe 'GET #edit' do
    let(:user) { create(:user) }
    it 'assigns the requested user to @user' do
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it 'renders the :edit template' do
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end
end
