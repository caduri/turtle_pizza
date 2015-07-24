class Admin::DoeKindsController < ApplicationController
  def index
  end

  def new
    @doe_kind = DoeKind.new
  end

  def create
    @doe_kind = DoeKind.new
    @doe_kind.name = params[:doe_kind][:name]
    @doe_kind.save
    redirect_to :action => "index", notics: "The doe kind has been added"
  end

  def edit
    @doe_kind = DoeKind.find(params[:id])
  end

  def update
    @doe_kind = DoeKind.find(params[:id])
    @doe_kind.update_attributes(params[:doe_kind])
    redirect_to :action => "index", notics: "The doe kind has been updated"
  end
end
