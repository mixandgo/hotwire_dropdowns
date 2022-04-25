class SiteController < ApplicationController
  before_action :find_mmy

  def index
    @makes = Make.all
    @models = @make&.models || []
    @years = @model&.years || []
  end

  private

    def find_mmy
      @make = Make.find_by(id: params[:make].presence)
      @model = Model.find_by(id: params[:model].presence)
      @year = Year.find_by(id: params[:year].presence)
    end
end
