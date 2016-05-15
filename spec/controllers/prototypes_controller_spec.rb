require 'rails_helper'

describe PrototypesController do
  context 'with user login' do
    before { login_user }
    let(:user) { create(:user) }
  end

  context 'without user login' do
    let(:user) { create(:user) }
    let(:params) {{
      id: user.id,
      user: {
        name: user.name,
        email: user.email,
        position: user.position,
        profile: user.profile,
        occupation: user.occupation
      }
    }}
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'post #create' do
      it 'redirects sign_in page' do
        post :create 
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: user.id
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, params
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: user.id
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
