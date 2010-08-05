class Dropdown < ActiveRecord::Base
  belongs_to :exercise
  
  has_many :dropdown_options, :dependent => :destroy
  accepts_nested_attributes_for :dropdown_options, 
    :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
end
