class Video < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  delegate :username, to: :user, prefix: true
  YT_LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i

  validates :link, presence: true, format: YT_LINK_FORMAT
end
