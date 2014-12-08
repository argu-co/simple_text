class Document < ActiveRecord::Base
  validates_length_of :name, minimum: 4, maximum: 100
  validates_length_of :title, minimum: 4, maximum: 100

end
