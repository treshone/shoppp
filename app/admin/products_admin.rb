Trestle.resource(:products) do
  menu do
    item :products, icon: "fa fa-cloud"
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :id
    column :category
    column :image do |product|
      image_tag( image_url(product.image) )
    end
    column :title
    column :description
    column :price
    column :is_active, align: :center do |product|
      status_tag(icon("fa fa-check"), :success) if product.is_active?
    end
    #   column :created_at, align: :center
  #   actions
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |product|

    collection_select :category_id, Category.all, :id, :title, { label: 'Категория' }
    file_field :image
    text_field :title
    text_area :description
    text_field :price
    check_box :is_active
  
  #   row do
  #     col(xs: 6) { datetime_field :updated_at }
  #     col(xs: 6) { datetime_field :created_at }
  #   end
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  params do |params|
    params.require(:product).permit(:category_id, :image, :title, :description, :price, :is_active)
  end
end
