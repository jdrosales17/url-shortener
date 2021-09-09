# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LinksController#info', type: :request do
  let(:link) { create(:link) }

  describe 'GET	/links/:link_token/info' do
    subject { get link_info_path(link_token: link.token) }

    it 'shows the link visits info' do
      subject
      expect(response.body).to include('The link has no visits.')
    end

    context 'when a visit already exists' do
      let!(:visit) { create(:visit, link: link) }

      it 'shows the link visits info' do
        subject
        expect(response.body).to include(visit.ip_address)
      end
    end
  end
end
