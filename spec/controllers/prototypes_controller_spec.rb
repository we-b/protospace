require 'rails_helper'

describe PrototypesController do
   let!(:prototype) { create(:prototype, :with_sub_images) }
   let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'hoge', tag_list: 'hoge')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil, tag_list: 'hoge')
   }}

  context 'with user login' do
    before { login_user }
    describe 'GET #index' do
      before :each do
        get :index
      end

      it 'assigns the requested prototypes to @prototypes' do
        expect(assigns(:prototypes)).to include prototype
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before :each do
        get :new
      end

      it 'assignes the requested prototype to @prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end

      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      it 'assigns the requested prototype to @prototype' do
      end

      context 'with valid attribtues' do
        it 'saves the new prototype in the database' do
          expect {
            post :create, params
          }.to change(Prototype, :count).by(1)
        end

        before :each do
          post :create, params
        end

        it 'redirects to root_path' do
          expect(response).to redirect_to root_path
        end

        it 'shows flash messages to show save the prototype successfully' do
          expect(flash[:notice]).to eq 'New prototype was successfully created'
        end
      end

      context 'with invalid attribtues' do
        it 'does not save the new prototype in the database' do
          expect {
            post :create, invalid_params
          }.not_to change(Prototype, :count)
        end

        before :each do
          post :create, invalid_params
        end

        it 'redirects new_prototype_path' do
          expect(response).to redirect_to new_prototype_path
        end

        it 'shows flash messages to show save the prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'New prototype was unsuccessfully created'
        end
      end

    end

    describe 'GET #show' do
      before :each do
        get :show, id: prototype
      end

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'assigns the requested comment to @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
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

      it 'assigns the requested prototype to @prototype' do
        expect(assigns(:prototype)).to eq prototype
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
      context 'with valid attributes' do
        before :each do
          patch :update, params
        end
        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'assigns the requested comment to @comment' do
          expect(assigns(:comment)).to be_a_new(Comment)
        end

        it 'updates attributes of prototype' do
          prototype.reload
          expect(prototype.title).to eq 'hoge'
        end

        it 'redirects to prototype_path'  do
          expect(response).to redirect_to prototype_path(prototype)
        end

        it 'shows flash message to show update prototype successfully' do
          expect(flash[:notice]).to eq 'Your prototype was successfully updated'
        end
      end

      context 'with invalid attributes' do
        before :each do
          patch :update, invalid_params
        end

        it 'assigns the requested prototype to @prototype' do
          expect(assigns(:prototype)).to eq prototype
        end

        it 'does not save the new prototype' do
          prototype.reload
          expect(prototype.title).not_to eq 'hoge'
        end

        it 'renders the :show template' do
          expect(response).to render_template :edit
        end

        it 'shows flash message to show update prototype unsuccessfully' do
          expect(flash[:alert]).to eq 'Your prototype was unsuccessfully updated'
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:prototype_d) { create(:prototype) }

      it 'assigns the requested prototype to @prototype' do
        delete :destroy, id: prototype_d
        expect(assigns(:prototype)).to eq prototype_d
      end

      context 'with valid attribtues' do
        it 'deletes the prototype' do
         expect{
           delete :destroy, id: prototype_d
         }.to change(Prototype, :count).by(-1)
        end

        it 'redirects to root_path' do
          delete :destroy, id: prototype_d
          expect(response).to redirect_to root_path
        end

        it 'shows flash message to show delete prototype successfully' do
          delete :destroy, id: prototype_d
          expect(flash[:notice]).to eq 'The prototype was successfully deleted'
        end
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
