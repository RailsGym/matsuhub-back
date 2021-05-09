require 'rails_helper'

describe Canvas::Show do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let!(:area) { create(:area) }
  let!(:area2) { create(:area, area_type: 'vision', area_type_text: 'ビジョン', description: '中長期的に顧客どういう状況になってもらいたいか？') }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
  let(:user) { create(:user) }
  let!(:label) { create(:label, area: area, canvas: canvas, created_user: user, title: 'テスト') }
  let!(:label2) { create(:label, area: area, canvas: canvas, created_user: user, title: 'テスト2') }
  let(:inputs) {
    {
        canvas: canvas
    }
  }

  context 'inputがない場合' do
    let(:inputs) { {} }

    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors).to have_key :canvas }
  end

  context '#execute' do
    it '指定のキャンバスに紐づく仮説がエリア毎に全て返る' do
      expect(outcome).to be_valid
      expect(result[:canvas][:title]).to eq 'テストキャンバス'
      expect(result[:canvas][:areas].count).to eq 2
      first_area = result[:canvas][:areas].first
      expect(first_area[:area_type]).to eq 'purpose'
      expect(first_area[:area_type_text]).to eq 'Purpose'
      expect(first_area[:description]).to eq 'われわれはなぜこの事業をやるのか？'
      expect(first_area[:labels].count).to eq 2
      expect(first_area[:labels].pluck(:title)).to eq ['テスト', 'テスト2']

      second_area = result[:canvas][:areas].second
      expect(second_area[:area_type]).to eq 'vision'
      expect(second_area[:labels].count).to be_zero
    end
  end
end