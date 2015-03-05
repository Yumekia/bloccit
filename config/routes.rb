Rails.application.routes.draw do
  get 'contact/index'

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'  
end
