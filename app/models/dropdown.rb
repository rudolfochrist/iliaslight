class Dropdown < ActiveRecord::Base
  belongs_to :exercise
  has_many :dropdown_definitions
  accepts_nested_attributes_for :dropdown_definitions,
    :allow_destroy => true, :reject_if => proc { |obj| obj["definition"].blank? }
end
