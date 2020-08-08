RailsAdmin.config do |config|
  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['History']
    end
    # export
    bulk_delete
    show
    edit do
      except ['History']
    end
    delete do
      except ['History']
    end
    show_in_app
  end

  config.model 'Course' do
    list do
      field :name
      field :theme
      field :price
      field :currency
      field :course_type
      field :on_shelf
      field :url
      field :description
      field :expire_time
    end
  end
end
