# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:visits) }
  end

  describe 'validations' do
    subject { build(:link) }

    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:token) }
    it { is_expected.to validate_uniqueness_of(:token) }

    it 'validates the URL' do
      is_expected.to allow_value('https://valid.url').for(:url)
      is_expected.not_to allow_value('invalid_url').for(:url)
      is_expected.not_to allow_value('').for(:url)
    end
  end
end
