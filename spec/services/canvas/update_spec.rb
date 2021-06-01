require 'rails_helper'

describe Canvas::Update do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
  let(:title)  { 'テスト2キャンバス' }
  let(:inputs) {
    {
        canvas: canvas,
        title: title
    }
  }

  context 'inputがない場合' do
    let(:inputs) { {} }

    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors).to have_key :canvas }
  end

  context 'キャンバスが空文字の場合' do
    let(:inputs) { { canvas: canvas, title: ''} }

    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors.full_messages).to eq ['タイトルを入力してください'] }
  end

  context '#execute' do
    it 'キャンバス名が更新できる' do

      expect(outcome).to be_valid
      expect(result.title).to eq 'テスト2キャンバス'
      expect(canvas.title).to eq 'テスト2キャンバス'
    end
  end
end