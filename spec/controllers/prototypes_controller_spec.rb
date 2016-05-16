require 'rails_helper'

describe PrototypesController do
   let(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attribtues_for(:prototype) 
   }}

  context 'with user login' do
    before { login_user }
    describe 'GET #index' do
      it 'assings the requested prototypes to @prototypes' do
        get :index
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
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
      it 'assigns main_image to @main_image' do
        get :edit, id: prototype
        expect(assigns(:main_image)).to eq prototype.main_image
      end

      it 'assigns sub_images to @sub_images' do
        get :edit, id: prototype
        expect(assigns(:sub_images)).to eq prototype.captured_images.sub
      end

      it 'renders the :edit template' do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end
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
        patch :update, id: prototype
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
