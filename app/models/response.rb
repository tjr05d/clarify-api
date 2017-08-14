class Response < ApplicationRecord
  belongs_to :clarification
  validates :response_text, presence: true
end
