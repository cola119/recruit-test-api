Rails.application.routes.draw do
  Rails.application.routes.draw do
    namespace 'api' do
      namespace 'v1' do
        post 'signup', to: 'users#new'
        get 'users/:user_id', to: 'users#show'
        patch 'users/:user_id', to: 'users#upadte'
        post 'close', to: 'users#destroy'
      end
    end
  end
end
