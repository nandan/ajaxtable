module ItemHelper
  def pagination_links_remote(paginator)
    page_options = {:window_size => 1}
    pagination_links_each(paginator, page_options) do |n|
      options = {
        :url => {:action => 'list', :params => params.merge({:page => n})},
        :update => 'table',
        :before => "Element.show('spinner')",
        :success => "Element.hide('spinner')"
      }
      html_options = {:href => url_for(:action => 'list', :params => params.merge({:page => n}))}
      link_to_remote(n.to_s, options, html_options)
    end
  end
  def sort_td_class_helper(param)
    result = 'class="sortup"' if params[:sort] == param
    result = 'class="sortdown"' if params[:sort] == param + "_reverse"
    return result
  end
  def sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
      :url => {:action => 'list', :sort => key, :page => params[:page], :query =>params[:query]},
      :update => 'table',
      :before => "Element.show('spinner')",
      :success => "Element.hide('spinner')",
      :method => :get
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'list',:sort => key, :page => params[:page], :query =>params[:query]),
      :method => :get
    }
    link_to_remote(text, options, html_options)
  end

end
