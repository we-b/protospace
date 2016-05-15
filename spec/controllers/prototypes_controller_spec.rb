require 'rails_helper'

describe PrototypesController do
   let(:prototype) { create(:prototype) }
   let(:params) {{
     id: prototype.id,
     prototype: {
       title: prototype.title,
       catch_copy: prototype.catch_copy,
       concept: prototype.concept
     }
   }}

  context 'with user login' do
    before { login_user }
    describe 'GET #index' do

    end

    describe 'GET #new' do

    end

    describe 'POST #create' do

    end

    describe 'GET #show' do
      it 'assigns the requested prototype to @prototype' do
        get :show, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end
      
      it 'assigns likes associated with prototype to @likes' do
        get :show, id: prototype
        expect(assigns(:likes)).to eq prototype.likes
      end

      it 'renders the :show template' do
        get :show, id: prototype
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do

    end

    describe 'PATCH #update' do

    end

    describe 'DELETE #destroy' do

    end
  end

  context 'without user login' do
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
        get :edit, id: prototype.id
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
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
