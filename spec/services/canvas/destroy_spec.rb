require 'rails_helper'
describe Canvas::Destroy do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let!(:area) { create(:area) }
  let!(:area2) { create(:area, area_type: 'vision', description: '中長期的に顧客どういう状況になってもらいたいか？') }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
  let(:user) { create(:user) }
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
    it 'キャンバスが削除されている' do

      expect(outcome).to be_valid
      expect(result).to eq nil
      expect(Canvas.count).to eq 0
    end
  end
end