# -*- encoding : utf-8 -*-
Webgestv::Application.routes.draw do

  resources :alrts
  resources :alr_mntr_frmls

  match 'laynet_ele/testconn' => 'laynet_eles#testconn', :via => :get
  match 'net_ele/testconn' => 'net_eles#testconn', :via => :get
  match 'serv/testconn' => 'servs#testconn', :via => :get
  match "/update_linksb" => "links#update_linksb"

  match "/frmls/state" => "alr_mntr_frmls#state", :via => :get
  match "/alr_mntr_cntrs/state" => "alrtrs#state"
  match "/alr_mntr_rngs/state" => "alr_mntr_rngs#state"

  match "/reports/index" => "reports#index"
  match '/reports/datostiemporeal' => 'reports#datostiemporeal'
  match '/actualizartabla' => 'reports#actualizartabla'
  match '/buscaratributo' => 'reports#buscaratributo'
  match '/buscarmacroatributo' => 'reports#buscarmacroatr'
  match '/rango' => 'reports#rango'

  match "/composites/index" => "composites#index"
  match '/searchatr' => 'composites#searchatr'
  match '/actualizar' => 'composites#actualizar'
  match '/items' => 'composites#items'
  match '/search' => 'composites#search'
  match '/edit_multiple' => 'composites#edit_multiple'

  resources :uploads do
    post :new, on: :member
    post :load, on: :member
  end

  resources :links

  resources :laynet_eles do
    get :delparams, on: :member
    resources :mcr_atrs do
      resources :atrs
    end
  end
  resources :net_eles do
    get :delparams, on: :member
    resources :mcr_atrs do
      resources :atrs
    end
  end
  resources :servs do
    get :delparams, on: :member
    resources :mcr_atrs do
      resources :atrs
    end
  end

  resources :man_rscs do
    resources :mcr_atrs do
      resources :alr_mntr_frmls
      resources :atrs do
        resources :alr_mntr_cntrs
        resources :alr_mntr_rngs
      end
    end
  end

  root :to => "static#index"
end
