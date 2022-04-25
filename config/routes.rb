Rails.application.routes.draw do
  get "/makes", to: "site#makes"
  get "/:make/models", to: "site#models"
  get "/:model/years", to: "site#years"
  root "site#index"
end
