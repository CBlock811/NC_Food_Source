class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
    @products = @supplier.products
  end

  def new
    @supplier = Supplier.new
    authorize @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier

    if @supplier.save!
      redirect_to @supplier
    else
      flash[:error] = "There was an error saving. Please try again."
      render :new
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
    authorize @supplier
  end

  def update
    @supplier = Supplier.find(params[:id])
    authorize @supplier

    if @supplier.update_attributes(supplier_params)
      flash[:notice] = "Supplier was updated."
      redirect_to @supplier
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    name = @supplier.name
    authorize @supplier

    if @supplier.destroy
      flash[:notice] = "\"#{name}\" was deleted successfully."
      redirect_to @supplier
    else
      flash[:error] = "There was an error deleting the supplier"
      render :show
    end
  end

  private
 
  def supplier_params
    params.require(:supplier).permit(:name, :description, :email)
  end
end