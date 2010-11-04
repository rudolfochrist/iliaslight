class Exercise < ActiveRecord::Base
  validates_presence_of :chapter, :message => "can't be blank"
  validates_uniqueness_of :chapter, :message => "must be unique"
    
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
    mcs = multiple_choices.reverse
    scs = single_choices.reverse
    marks = marktexts.reverse
    cloz = clozes.reverse
    drops = dropdowns.reverse
    order = type_sequence_positions
    @export_type_order = Array.new
    order.each do |type|
      case type.type_name
      when "multiple_choices"
        obj = mcs.pop
        @export_type_order << obj unless obj.nil?
      when "single_choices"
        obj = scs.pop
        @export_type_order << obj unless obj.nil?
      when "marktexts"
        obj = marks.pop
        @export_type_order << obj unless obj.nil?
      when "clozes"
        obj = cloz.pop
        @export_type_order << obj unless obj.nil?
      when "dropdowns"
        obj = drops.pop
        @export_type_order << obj unless obj.nil?
      end
    end
    
    template = File.read("public/exercise_export_template.haml")
    haml_engine = Haml::Engine.new(template)
    output = haml_engine.render(scope=self)
    
    if File.exists?("public/html")
      File.open("public/html/#{chapter.split("#").first.split(".").join("_")}.html", "w") do |f|
        f.write(output)
      end
    else 
      Dir.mkdir("public/html")
      File.open("public/html/#{chapter.split("#").first.split(".").join("_")}.html", "w") do |f|
        f.write(output)
      end
    end
  end

  
  def destroy_export
    begin
      File.delete("public/html/#{chapter.split(".").join("_")}.html")
    rescue
      p "file already deleted"
    end
  end
end
