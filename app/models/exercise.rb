class Exercise < ActiveRecord::Base
  acts_as_list
  validates_presence_of :chapter, :message => "can't be blank"
  
  
  has_many :multiple_choices, :dependent => :destroy
  accepts_nested_attributes_for :multiple_choices, :allow_destroy => true
    
  has_many :single_choices, :dependent => :destroy
  accepts_nested_attributes_for :single_choices, :allow_destroy => true
    
  has_many :marktexts, :dependent => :destroy
  accepts_nested_attributes_for :marktexts, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["mark"].blank? }
  
  has_many :clozes, :dependent => :destroy
  accepts_nested_attributes_for :clozes, 
    :allow_destroy => true, :reject_if => proc { |obj| obj["cloze_text"].blank? }
  
  has_many :dropdowns, :dependent => :destroy
  accepts_nested_attributes_for :dropdowns, :allow_destroy => true
  
  def construct_sequence
    seq = Array.new
    seq << multiple_choices unless multiple_choices.empty?
    seq << single_choices unless single_choices.empty?
    seq << marktexts unless marktexts.empty?
    seq << clozes unless clozes.empty?
    seq << dropdowns unless dropdowns.empty?
    seq.flatten!
    seq.sort! do |t1, t2|
      t1.position <=> t2.position
    end
    seq
  end
  
end
