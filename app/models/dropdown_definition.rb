class DropdownDefinition < ActiveRecord::Base
  belongs_to :dropdown
  
  has_many :dropdown_options
  accepts_nested_attributes_for :dropdown_options,
   :allow_destroy => true, :reject_if => proc { |obj| obj["option"].blank? }
  
end
