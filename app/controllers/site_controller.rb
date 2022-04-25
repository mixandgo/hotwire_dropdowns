class SiteController < ApplicationController
  before_action :find_mmy

  def index
    @makes = Make.all
    @models = @make&.models || []
    @years = @model&.years || []
  end

  def makes
    render json: Make.all.to_json
  end

  def models
    render json: [] and return unless @make

    render json: @make.models.to_json
  end

  def years
    render json: [] and return unless @model

    render json: @model.years.to_json
  end

  private

    def find_mmy
      @make = Make.find_by(id: params[:make].presence)
      @model = Model.find_by(id: params[:model].presence)
      @year = Year.find_by(id: params[:year].presence)
    end
end
