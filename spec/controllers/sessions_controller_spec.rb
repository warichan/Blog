require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  fixtures :users
  describe 'GET new' do
    it 'newテンプレートがレンダリングされること' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    it 'ログインに成功したらrootにリダイレクトされること' do
      post :create, "email" => "arichan@ne.jp", "password" => "arichan"
      expect(response).to redirect_to root_url
    end
    it 'ログインに失敗したらnewテンプレートがレンダリングされること' do
      post :create
      expect(response).to render_template(:new)
    end
  end

  describe 'DELETE destroy' do
    it "ログアウトしたらrootにリダイレクトされること" do
      delete :destroy
      expect(response).to redirect_to root_url
    end
  end
end
