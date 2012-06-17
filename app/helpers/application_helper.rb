module ApplicationHelper

  def image_link(item, type)
    render :partial => 'items/image_link', :locals => {:item => item, :type => type} if @item.send(type.to_s + '_image?')
  end

end
