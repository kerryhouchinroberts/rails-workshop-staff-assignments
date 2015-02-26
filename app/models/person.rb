class Person < ActiveRecord::Base

  def full_name
    " #{title} #{first_name} #{last_name}"
  end

  validates :last_name, presence: true
  validates :title, presence:true, unless: ->(person){person.first_name.present?}
  validates :first_name, presence: true, unless: ->(person){person.title.present?}

end
