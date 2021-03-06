# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_token  (token) UNIQUE
#

class Link < ApplicationRecord
  has_many :visits, dependent: :destroy

  validates :url, :token, presence: true
  validates :url, url: true
  validates :token, uniqueness: true
end
