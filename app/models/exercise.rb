class Exercise < ActiveRecord::Base
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :chapter, :message => "can't be blank"
  
  has_many :sequence_lines
  accepts_nested_attributes_for :sequence_lines, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["question_type"].blank? }
  
  has_many :multiple_choice_options, :dependent => :destroy 
  accepts_nested_attributes_for :multiple_choice_options, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["option"].blank? }
    
  has_many :single_choice_options, :dependent => :destroy
  accepts_nested_attributes_for :single_choice_options, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["option"].blank? }
    
  has_many :marktexts, :dependent => :destroy
  accepts_nested_attributes_for :marktexts, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["mark"].blank? }
  
  has_many :clozes, :dependent => :destroy
  accepts_nested_attributes_for :clozes, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["cloze_text"].blank? }
  
  has_many :dropdowns, :dependent => :destroy
  accepts_nested_attributes_for :dropdowns, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["definition"].blank? }
    
  has_one :help
  accepts_nested_attributes_for :help, :allow_destroy => true
end
