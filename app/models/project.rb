class Project < ActiveRecord::Base
  belongs_to :user
  has_many :lists

  accepts_nested_attributes_for :lists
end
