# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if url_valid?(value)

    record.errors.add(attribute, 'must be valid')
  end

  private

  def url_valid?(url)
    parsed_url = URI.parse(url)
    (parsed_url.is_a?(URI::HTTP) || parsed_url.is_a?(URI::HTTPS)) && !parsed_url.host.blank?
  rescue URI::InvalidURIError
    false
  end
end
