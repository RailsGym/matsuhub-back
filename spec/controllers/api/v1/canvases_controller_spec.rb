require 'rails_helper'

RSpec.describe Api::V1::CanvasesController, type: :request do
  let!(:user) { create(:user, email: 'yamada@example.com', password: 'password') }
  let!(:canvas) { create(:canvas, owner: user) }
  let!(:canvas2) { create(:canvas, owner: user) }
  let!(:canvas3) { create(:canvas) }
  let!(:canvas_member) { create(:canvas_member, canvas: canvas, user: user) }
  let!(:canvas_member2) { create(:canvas_member, canvas: canvas2, user: user) }

  describe '.index' do
    it 'ログイン済みユーザが参照できるキャンバス一覧が取得できる' do
      login_user = { email: 'yamada@example.com', password: 'password' }
      auth_tokens = sign_in(login_user)
      get '/api/v1/canvases', headers: auth_tokens, as: :json
      expect(response).to have_http_status :ok

      body = JSON.parse(response.body)
      expect(body.count).to eq 2
      expect(body.first['title']).to eq 'テストキャンバス1'
      expect(body.second['title']).to eq 'テストキャンバス2'
    end

    it 'ログイン済みでない場合キャンバス一覧を取得できない' do
      get '/api/v1/canvases'
      expect(response).to have_http_status :unauthorized
    end
  end

  describe '.create' do
    it 'ログイン済みユーザがキャンバスを作成できる' do
      login_user = { email: 'yamada@example.com', password: 'password' }
      auth_tokens = sign_in(login_user)
      post '/api/v1/canvases', headers: auth_tokens, params: {canvas: { title:'title' }}
      expect(response).to have_http_status :ok

      body = JSON.parse(response.body)
      expect(body['canvas']['title']).to eq 'title'
      expect(body['canvas']['owner_id']).to eq 1
      expect(Canvas.count).to eq 4
      expect(Canvas.last).to have_attributes(title: 'title', owner: user)
      expect(user.canvas_members.count).to eq 3
    end

    it 'ログイン済みでない場合ユーザはキャンバスを作成できない' do
      post '/api/v1/canvases', params: {canvas: { title:'title' }}
      expect(response).to have_http_status :unauthorized
      expect(Canvas.count).to eq 3
      expect(user.canvas_members.count).to eq 2
    end

    it 'キャンバス名が空文字の場合キャンバスを作成できない' do
      login_user = { email: 'yamada@example.com', password: 'password' }
      auth_tokens = sign_in(login_user)
      post '/api/v1/canvases', headers: auth_tokens, params: {canvas: { title: "" }}
      expect(response).to have_http_status :bad_request
      expect(Canvas.count).to eq 3
      expect(user.canvas_members.count).to eq 2
    end
  end
end