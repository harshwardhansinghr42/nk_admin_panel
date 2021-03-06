RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.included_models = [ Category, Product, ProductComment, Tag, User, UserProduct]
  
  config.model 'Product' do
    list do
      include_all_fields
      field :images do
        filterable false
        searchable false
      end
    end
  end

  config.actions do
    dashboard
    index
    new do
      except [User, ProductComment, UserProduct]
    end
    export
    bulk_delete do
      except [User, UserProduct]
    end
    show
    edit do
      except [User, ProductComment, UserProduct]
    end
    delete do
      except [User, UserProduct]
    end
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
