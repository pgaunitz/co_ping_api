require 'rails_helper'

RSpec.describe Community, type: :model do
  it 'should have valid Factory' do
    expect(create(:community)).to be_valid
  end
  describe 'Database table' do
    it { is_expected.to have_db_column :code }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_many :users }
  end
  describe 'Validations' do
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :name }
  end
end
