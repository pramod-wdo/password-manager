class Entry < ApplicationRecord
  belongs_to :user
  validates :name, :username, :password, presence: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validate :url_must_be_valid

  encrypts :username, deterministic: true
  ecrypts :password

  private

  def url_must_be_valid
    uri = URI.parse(url)
    unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
      errors.add(:url, "must be a valid HTTP or HTTPS URL")
    end
  rescue URI::InvalidURIError
    errors.add(:url, "must be a valid URL")
  end
end
