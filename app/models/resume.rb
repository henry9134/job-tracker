class Resume < ApplicationRecord
  has_many :educations, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :certifications, dependent: :destroy

  accepts_nested_attributes_for :educations, :experiences, :skills, :certifications, allow_destroy: true
end
