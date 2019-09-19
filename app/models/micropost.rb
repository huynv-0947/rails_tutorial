class Micropost < ApplicationRecord
  belongs_to :user

  scope :order_created_at, -> {order created_at: :desc}
  scope :feed, -> (current_user_id) {where user_id: current_user_id}

  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.POST_CONTENT_MAX}
  validate :picture_size

  private

  def picture_size
    return if picture.size <= Settings.POST_PICTURE_MAX.megabytes
    errors.add(:picture, I18n.t("micropost_image_size_validate"))
  end
end
