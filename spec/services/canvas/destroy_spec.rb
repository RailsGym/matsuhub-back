require 'rails_helper'
describe Canvas::Destroy do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
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