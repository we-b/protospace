require 'rails_helper'

describe UsersController do
  before { login_user }

  let(:user) { create(:user) }

  describe 'GET #show' do
    it 'assigns the requested to @user' do
      get :show, id: user 
      expect(assigns(:user)).to eq user
    end

    it 'renders the :show templates' do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
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
