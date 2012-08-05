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
    true
  end

end
