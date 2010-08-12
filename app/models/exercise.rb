class Exercise < ActiveRecord::Base
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :chapter, :message => "can't be blank"
  
  has_many :type_sequence_positions
  accepts_nested_attributes_for :type_sequence_positions, :allow_destroy => true
  
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
  
  def export_to_html
    template = ERB.new(File.new("public/exercise_template.erb").read, nil, "%")
    chapter = self.chapter.split(".").join("_")
    mcs = multiple_choices
    result = template.result(binding)
    
    File.open("public/html/#{chapter}.html", "w+") do |f|
      f.write(result)
    end
  end
end
