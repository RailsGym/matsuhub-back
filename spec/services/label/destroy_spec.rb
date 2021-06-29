require 'rails_helper'
describe Label::Destroy do
  let(:outcome) { described_class.run(inputs) }
  let(:result) { outcome.result }
  let!(:area) { create(:area) }
  let(:canvas) { create(:canvas, title: 'テストキャンバス') }
  let(:user) { create(:user) }
  let!(:label) { create(:label, area: area, canvas: canvas, created_user: user, title: 'テストラベル') }
  let(:inputs) {
    {
      label: label
    }
  }
  context 'inputがない場合' do
    let(:inputs) { {} }
    it { expect(canvas.labels.count).to eq 1 }
    it { expect(outcome).to be_invalid }
    it { expect(outcome.errors).to have_key :label }
  end

  context '#execute' do
    it 'キャンバスが削除されている' do

      expect(outcome).to be_valid
      expect(result).to eq label
      expect(Label.count).to eq 0
      expect(canvas.labels.count).to eq 0
    end
  end
end