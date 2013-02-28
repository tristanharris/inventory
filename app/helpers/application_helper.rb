module ApplicationHelper

  def image_link(item, type)
    render :partial => 'items/image_link', :locals => {:item => item, :type => type} if @item.send(type.to_s + '_image?')
  end

  def image_for(item, options={})
    types = [:usage, :store]
    types.keep_if{|t| item.send(t.to_s + '_image?')}
    image_tag item.send(types.first.to_s + '_image').thumb.url, options unless types.empty?
  end

  def image_index?
    session[:style] == 'grid'
  end

  def booking_checkbox(form, item)
    form.check_box :item_ids, {:id => nil, :name => "#{form.object_name}[item_flags][#{item.id}]", :checked => form.object.items.include?(item)}
  end
end
