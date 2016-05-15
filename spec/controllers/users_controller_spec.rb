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

  describe 'PATCH #update' do
    let(:params) {{
      id: user.id,
      user: {
        name: 'hoge',
        email: user.email,
        position: user.position,
        profile: user.profile,
        occupation: user.occupation
      }
    }}

    it 'assigns the requested user to @user' do
      patch :update, params
      expect(assigns(:user)).to eq user
    end

    it 'changes @user\'s attribtues' do
      patch :update, params
      user.reload
      expect(user.name).to eq 'hoge'
    end

    it 'redirects root path' do
      patch :update, params
      expect(response).to redirect_to root_path
    end

    it 'sends flash messages' do
      patch :update, params
      expect(flash[:notice]).to be_present
    end
  end
end
