class Assignment < ActiveRecord::Base
  belongs_to :location
  belongs_to :person

  validates :location_id, uniqueness: true, if: ->(assignment){person.assignments.where('id !=?', id).find_by(location_id: location_id, role: role)}

end
