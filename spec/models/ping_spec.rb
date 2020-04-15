require 'rails_helper'

RSpec.describe Ping, type: :model do
  it 'should have valid Factory' do
    expect(create(:ping)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :time }
    it { is_expected.to have_db_column :store }
    it { is_expected.to belong_to :user}
    it { is_expected.to have_many :pongs }
  end
  
  describe 'Validations' do
    it { is_expected.to validate_presence_of :time }
  end
end
