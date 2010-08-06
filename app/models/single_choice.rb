class SingleChoice < ActiveRecord::Base
  belongs_to :exercise
  has_many :single_choice_options, :dependent => :destroy
  accepts_nested_attributes_for :single_choice_options, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["option"].blank? }
end
