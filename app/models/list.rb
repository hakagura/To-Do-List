class List < ActiveRecord::Base
  validates :name,:presence => true 

  belongs_to :project
  has_many :tasks

  accepts_nested_attributes_for :tasks,:allow_destroy => true
end
