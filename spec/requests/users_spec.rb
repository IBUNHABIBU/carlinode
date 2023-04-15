require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST / users' do
    before do
      create(:user, id: 1)
    end

    it { should route(:post, '/users').to(action: :create) }

    it do
      params = {
          name: 'Jon',
          email: 'jondoe@example.com',
          password: 'password'
      }
      should permit(:name, :email, :password, :password_confirmation)
        .for(:create, params: params)
    end
  end
end
