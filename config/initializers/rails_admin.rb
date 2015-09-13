RailsAdmin.config do |config|
  ################  Global configuration  ################
  config.main_app_name = ['Área administrativa']
  config.default_items_per_page = 20
  config.compact_show_view = false

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    # show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

    ###  User  ###
    config.model 'User' do
      # navigation_label 'Gerenciar usuários'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :email
        field :updated_at
        field :admin
      end
      edit do
        # field :name
        field :email
        field :password
        field :password_confirmation
        field :admin
      end
      # show do
      #   field :email
      #   field :admin
      # end
    end

    ###  Product  ###
    config.model 'Product' do
      navigation_label 'Gerenciar produtos'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :product_subcategory
        field :order_of_importance
        field :image
      end
      edit do
        field :name
        field :product_subcategory, :belongs_to_association do
          inline_add false
          inline_edit false
        end
        field :order_of_importance
        field :image
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Product Categories  ###
    config.model 'ProductCategory' do
      navigation_label 'Gerenciar produtos'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
      end
      edit do
        field :name
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Product subcategories  ###
    config.model 'ProductSubcategory' do
      navigation_label 'Gerenciar produtos'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :product_category
      end
      edit do
        field :name
        field :product_category, :belongs_to_association do
          inline_add false
          inline_edit false
        end
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Country  ###
    config.model 'Country' do
      navigation_label 'Gerenciar Localidades'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :iso
      end
      edit do
        field :name
        field :iso
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  States  ###
    config.model 'State' do
      navigation_label 'Gerenciar Localidades'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :iso
        field :country
      end
      edit do
        field :name
        field :iso
        field :country
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Cities  ###
    config.model 'City' do
      navigation_label 'Gerenciar Localidades'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :state
      end
      edit do
        field :name
        field :state
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Company  ###
    config.model 'Company' do
      navigation_label 'Gerenciar empresas'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
        field :city
        field :line_of_business
        field :logo
      end
      edit do
        field :name
        field :address
        field :city
        field :line_of_business
        field :logo
        field :phone
        field :description, :wysihtml5 do
          config_options :html => true
        end
        field :status
        field :hightlight
        field :lat
        field :log
        field :facebook
        field :website
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  LineOfBusiness  ###
    config.model 'LineOfBusiness' do
      navigation_label 'Gerenciar empresas'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :name
      end
      edit do
        field :name
      end
      # show do
      #   field :name
      #   field :image
      # end
    end

    ###  Offers  ###
    config.model 'Offer' do
      navigation_label 'Gerenciar Ofertas'
      # navigation_icon 'icon-user'
      list do
        field :id
        field :product
        field :company
        field :start_date_offer do
          date_format :default
        end
        field :end_date_offer do
          date_format :default
        end
        field :offer_price
      end
      edit do
        field :product
        field :company
        field :start_date_offer do
          date_format :default
        end
        field :end_date_offer do
          date_format :default
        end
        field :regular_price
        field :offer_price
      end
      # show do
      #   field :name
      #   field :image
      # end
    end
  end
end
