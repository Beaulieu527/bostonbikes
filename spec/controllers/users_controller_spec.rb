require 'rails_helper'

describe UsersController, :type => :contoller do 

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end

  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in user
      end  
      
      it "loads correct user details" do 
        get :show, params: {id: user.id}
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user1
      end   
      it 'cannot access show page of user2' do
        get :show, params: { id: @user2.id }
        expect(response).to have_http_status(302)
        expect(assigns(:user)).not_to eq @user1
        expect(response).to redirect_to(root_path)
      end
    end

     context 'no user is logged in' do
      it 'redirects to sign in' do
        get :show, params: { id: @user1.id }
        redirect_to(root_path)
      end
    end

  
  end
end      