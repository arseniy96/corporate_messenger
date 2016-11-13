class Message < ApplicationRecord
  validates :text, presence: true, length: {minimum: 2, maximum: 1000}

  belongs_to :user
  belongs_to :chat

  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
