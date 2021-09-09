# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:link) }
  end

  describe 'validations' do
    subject { build(:visit) }

    it { is_expected.to validate_presence_of(:ip_address) }
    it { is_expected.to validate_presence_of(:times) }
    it { is_expected.to validate_uniqueness_of(:ip_address).scoped_to(:link_id).case_insensitive }
    it { is_expected.to validate_numericality_of(:times).is_greater_than_or_equal_to(0) }
  end
end
