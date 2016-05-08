require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  fixtures :users
  describe 'GET index' do
    it 'indexテンプレートがレンダリングされること' do
      get :index
      expect(response).to render_template(:index)
      #assings(:posts)
    end
  end
end
