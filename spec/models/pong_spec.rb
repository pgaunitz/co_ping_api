require 'rails_helper'

RSpec.describe Pong, type: :model do

  it 'should have valid Factory' do
    expect(create(:pong)).to be_valid
  end

  describe 'Database table' do
    it { is_expected.to have_db_column :item1 }
    it { is_expected.to have_db_column :item2 }
    it { is_expected.to have_db_column :item3 }
    it { is_expected.to have_db_column :active }
    it { is_expected.to have_db_column :status }
    it { is_expected.to belong_to :user}
    it { is_expected.to belong_to :ping}

  end
  
  describe 'Validations' do
    it { is_expected.to validate_presence_of :item1 }
  end
end
