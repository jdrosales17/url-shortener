# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    ip_address { '127.0.0.1' }
    times { 1 }
    link
  end
end
