class Assignment < ActiveRecord::Base
  belongs_to :location
  belongs_to :person

  validates :role, presence: true
end
