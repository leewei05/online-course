Rails.application.routes.draw do
  devise_for :users
  root to: redirect('/admin')
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount OnlineCourse::API => '/'
end
