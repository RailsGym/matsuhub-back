require 'rails_helper'

describe Label::Update do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let!(:area) { create(:area) }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
  let(:user) { create(:user) }
  let!(:label) { create(:label, area: area, canvas: canvas, created_user: user, title: 'テストラベル') }
  let(:title) { '更新テストラベル' }
  let(:description) { "テスト説明" }
  let(:inputs) {
    {
      label: label,
      title: title,
      area_id: area.id,
      description: description,
      user: user
    }
  }

  context 'inputがない場合' do
    let(:inputs) { {} }

    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors).to have_key :label }
  end

  context 'ラベルが空文字の場合' do
    let(:inputs) {
      {
        label: label,
        title: '',
        area_id: area.id,
        description: description,
        user: user
      }
    }

    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors.full_messages).to eq ['タイトルを入力してください'] }
  end

  context '#execute' do
    it 'ラベル名が更新できる' do

      expect(outcome).to be_valid
      expect(result.title).to eq '更新テストラベル'
      expect(label.title).to eq '更新テストラベル'
    end
  end
end