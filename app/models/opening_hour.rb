class OpeningHour < ApplicationRecord
  extend Enumerize

  belongs_to :shop

  enumerize :day, in: [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday], default: :monday

end
