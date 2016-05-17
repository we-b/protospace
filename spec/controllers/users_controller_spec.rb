require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
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

  context 'with user login' do
    before { login_user }

    describe 'GET #show' do
      before :each do
        get :show, id: user
      end

      it 'assigns the requested to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before :each do
        get :edit, id: user
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
        patch :update, params
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'changes @user\'s attribtues' do
        user.reload
        expect(user.name).to eq 'hoge'
      end

      it 'redirects root path' do
        expect(response).to redirect_to root_path
      end

      it 'sends flash messages' do
        expect(flash[:notice]).to be_present
      end
    end
  end

  context 'without user login' do
    describe 'GET #edit' do
      it 'redirects sign_in page'do
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end

  end
end
