Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1, path: "/" do
      resource :hospital_admin, only: %i[show create update destroy], path: "/admins"

      namespace :auth, path: "/" do
        post "/login", to: "sessions#create"
      end
    end
  end
end
