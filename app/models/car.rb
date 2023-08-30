class Car < ApplicationRecord
  has_one_attached :image
  validates :color, :engine, :year, :title, :price, :image, :description, presence: true

  scope :recent, ->(max_limit = 8) { order('created_at').limit(max_limit) }

  def imageUrl

    if image.present? && image.attached?
      image.blob.service_url if image.attached?
    end
  end
end
