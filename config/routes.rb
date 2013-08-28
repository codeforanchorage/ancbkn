Ancbkn::Application.routes.draw do
  resources :crimes, except: [:new, :edit] do
    collection do
      post 'bulk'
    end
  end
end
