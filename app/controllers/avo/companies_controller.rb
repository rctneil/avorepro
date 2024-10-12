# This controller has been generated to enable Rails' resource routes.
# More information on https://docs.avohq.io/3.0/controllers.html
class Avo::CompaniesController < Avo::ResourcesController
  def models
    render json: get_models(params[:company]) # return an array of models based on the company we received
  end

  def submodels
    render json: get_submodels(params[:model]) # return an array of submodels based on the model we received
  end

  private

  def get_models(company)
    company = Company.find(company)
    company.models.to_a
  end

  def get_submodels(model)
    model = Model.find(model)
    model.submodels.to_a
  end
end
