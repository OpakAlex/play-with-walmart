Rails.application.routes.draw do
  match '*all', to: 'application#cors_preflight_check', via: :options
  namespace :api do
    namespace :v1 do
      get "search", to: "search#index"
    end
  end

end
