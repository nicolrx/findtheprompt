Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

	resources :prompts, param: :slug
	post "save_prompt_score", to: "prompts#save_prompt_score"
end
