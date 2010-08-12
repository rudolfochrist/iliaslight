# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def link_to_add_type(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    hidden_fields = build_hidden_fields_for f, association
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_block", :f => builder)
    end
    fields += hidden_fields
    link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def build_hidden_fields_for(f, association)
    new_order = f.object.class.reflect_on_association(:type_sequence_positions).klass.new
    fields = f.fields_for :type_sequence_positions, new_order, :child_index => "new_#{association}" do |builder|
      builder.hidden_field :type_name, :value => association.to_s
    end
  end
end
