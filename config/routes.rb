Rails.application.routes.draw do
  mount OnlineCourse::API => '/'

  namespace :admin do
    resources :courses
  end
end
