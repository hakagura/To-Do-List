class Project < ActiveRecord::Base
  validates :name,:presence => true

  belongs_to :user
  has_many :lists

  accepts_nested_attributes_for :lists
end
