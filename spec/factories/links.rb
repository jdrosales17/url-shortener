# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    url { 'https://example.com/' }
    token { SecureRandom.alphanumeric(8) }
  end
end
