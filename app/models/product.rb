resources :images do 
  resouces :comments, only: [:create, :destroy]
end 