Trestle.resource(:orders) do
  menu do
    item :orders, icon: "fa fa-star"
  end

  # Customize the table columns shown on the index view.
  #

  collection do
    model.includes(:order_items)
  end

  table do
    column :id
    column :status
    column :Товар do |order|
      products = Product.where(id: order.order_items.map(&:product_id))
      products.each { |product| product.title }
    end
    column :Количество_товара do |order|
      order.order_items.map { |item| "#{item.product_count} шт." }
    end
    column :name
    column :phone
    column :email
    column :address
    column :comment

  #   column :created_at, align: :center
  #   actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |order|
  #   text_field :name
  #
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:order).permit(:name, ...)
  # end
end
