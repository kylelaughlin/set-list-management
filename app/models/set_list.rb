#name :string representing the name of the venue
#description :text representing notes for the set list

class SetList < ActiveRecord::Base

  validates :name, presence: true

end
