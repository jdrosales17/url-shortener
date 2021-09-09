# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LinksController#create', type: :request do
  let(:params) do
    {
      link: {
        url: 'https://example.com/'
      }
    }
  end

  describe 'POST /links' do
    subject { post links_path, params: params }

    it 'creates a link with the URL' do
      expect { subject }.to change { Link.count }.by(1)

      link = Link.last
      expect(link.url).to eq params[:link][:url]
    end

    it 'redirects to the link info page' do
      subject

      link = Link.last
      expect(response).to redirect_to link_info_path(link_token: link.token)
    end

    context 'when the URL is blank' do
      let(:params) do
        {
          link: {
            url: ''
          }
        }
      end

      it 'does not create a link' do
        expect { subject }.not_to change { Link.count }
      end

      it 'renders the form again with the errors' do
        subject
        expect(response.body).to include(CGI.escapeHTML("Url can't be blank"))
        expect(response.body).to include('Url must be valid')
      end
    end

    context 'when the URL is invalid' do
      let(:params) do
        {
          link: {
            url: 'invalid_url'
          }
        }
      end

      it 'does not create a link' do
        expect { subject }.not_to change { Link.count }
      end

      it 'renders the form again with the errors' do
        subject
        expect(response.body).to include('Url must be valid')
      end
    end
  end
end
