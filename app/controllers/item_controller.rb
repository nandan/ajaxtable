class ItemController < ApplicationController
  def list

    items_per_page = 10

    sort = case params['sort']
    when "name"  then "name"
    when "qty"   then "quantity"
    when "price" then "price"
    when "name_reverse"  then "name DESC"
    when "qty_reverse"   then "quantity DESC"
    when "price_reverse" then "price DESC"
    end

    conditions = ["name LIKE ?", "%#{params[:query]}%"] unless params[:query].nil?

    @total = Item.count(:conditions => conditions)
    @items = Item.paginate(:order => sort, :conditions => conditions, :per_page => items_per_page, :page => params[:page])

        if request.xml_http_request?
    
          render :partial => "items_list", :layout => false
    
        end
#    if request.xml_http_request?
#      render(:update) do |page|
#        page.replace_html 'item', :partial =>'pagination', :locals =>{:items =>@items}
#      end
#    end
  end

end
