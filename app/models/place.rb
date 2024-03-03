class Place < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validate :attachments_are_images

  has_many :events, dependent: :destroy
  has_one_attached :banner
  has_many_attached :pictures

  def attachments_are_images
    return unless pictures.attached?

    pictures.each do |picture|
      errors.add(:pictures, 'must be images') unless picture.image?
    end
  end
end
