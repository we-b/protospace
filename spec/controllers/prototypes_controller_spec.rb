require 'rails_helper'

describe PrototypesController do
   let(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, tag_list: 'hoge')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attribtues_for(:prototype, title: nil, tag_list: 'hoge')
   }}

  context 'with user login' do
    before { login_user }
    describe 'GET #index' do
      it 'assigns the requested prototypes to @prototypes' do
        get :index
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before :each do
        get :new
      end
      
      it 'assignes the requested prototype to @prototype' do
        get :new
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end
      it 'renders the :new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      it 'assigns the requested prototype to @prototype' do
        post :create, params
        expect(assigns(:prototype)).to to be_a_new(Prototype)
      end

      context 'with valid attribtues' do
        it 'saves the new prototype in the database' do
          expect {
            post :create, params
          }.to change(Prototype, :count).by(1)
        end
      end

      context 'with invalid attribtues' do
      end

    end

    describe 'GET #show' do
      before :each do
        get :show, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns likes associated with prototype to @likes' do
        expect(assigns(:likes)).to eq prototype.likes
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
      end
    end

    describe 'GET #edit' do
      before :each do
        get :edit, id: prototype
      end

      it 'assigns main_image to @main_image' do
        expect(assigns(:main_image)).to eq prototype.main_image
      end

      it 'assigns sub_images to @sub_images' do
        expect(assigns(:sub_images)).to eq prototype.captured_images.sub
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      before :each do
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      context 'with valid attributes' do
      end

      context 'with invalid attributes' do
      end

    end

    describe 'DELETE #destroy' do
      context 'with valid attribtues' do
      end

      context 'with invalid attribtues' do
      end

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
