# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LinksController#show', type: :request do
  let(:link) { create(:link) }

  describe 'GET /links/:token' do
    subject { get link_path(token: link.token) }

    it 'redirects to the link URL' do
      subject
      expect(response).to redirect_to link.url
    end

    it 'creates a visit with the request ip' do
      expect { subject }.to change { Visit.count }.by(1)

      visit = Visit.last
      expect(visit.ip_address).to eq request.remote_ip
      expect(visit.times).to eq 1
    end

    context 'when a visit already exists for the request ip' do
      let!(:visit) { create(:visit, link: link) }

      it 'does not create a visit' do
        expect { subject }.not_to change { Visit.count }
      end

      it 'updates the visit times' do
        expect { subject }.to change { visit.reload.times }.by(1)
      end
    end
  end
end
