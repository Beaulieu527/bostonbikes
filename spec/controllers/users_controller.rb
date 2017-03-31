require 'rails_helper'

describe UsersController, :type => :contoller do 
  let(:user) {User.create!(email: "justin@gmail.com", password: "123456")}

    describe 'GET#show' do
      context 'User is logged in' do
        before do
          sign_in user
        end  
      end
    
      context 'No user is logged in' do 
        it 'redirects to login' do 
          get :show, id: user.id    
        end  
      end 
  end
end      