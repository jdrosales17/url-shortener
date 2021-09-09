# frozen_string_literal: true

# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  ip_address :string           not null
#  times      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :bigint           not null
#
# Indexes
#
#  index_visits_on_ip_address_and_link_id  (ip_address,link_id) UNIQUE
#  index_visits_on_link_id                 (link_id)
#
# Foreign Keys
#
#  fk_rails_...  (link_id => links.id)
#

class Visit < ApplicationRecord
  belongs_to :link

  validates :ip_address, :times, presence: true
  validates :ip_address, uniqueness: { scope: :link_id, case_sensitive: false }
  validates :times, numericality: { greater_than_or_equal_to: 0 }
end
