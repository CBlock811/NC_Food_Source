class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
