class Profile < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    VALID_LINKEDIN_URL_REGEX = /\Ahttps?:\/\/(www\.)?linkedin\.com\/.*\z/

    validates :linkedin, presence: true ,  format: { with: VALID_LINKEDIN_URL_REGEX, message: "must be a valid LinkedIn URL" }
    validates :youtube, presence: true,  format: { with: /\Ahttps?:\/\/(www\.)?(youtube\.com\/watch\?v=|youtu\.be\/)[\w\-]+\z/, message: "must be a valid YouTube URL" }
    validates :twitter, presence: true, format: { with: /\Ahttps?:\/\/(www\.)?twitter\.com\/[A-Za-z0-9_]+\z/, message: "must be a valid Twitter URL" }
    validates :name, presence: true, length: { minimum: 3 }

    # belongs_to :user
end
