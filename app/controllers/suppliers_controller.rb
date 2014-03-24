class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(params[:supplier].permit(:name, :description))

    if @supplier.save!
      redirect_to @supplier
    else
      flash[:error] = "There was an error saving. Please try again."
      render :new
    end
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update_attributes(params.require(:supplier).permit(:name, :description))
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

  if @supplier.destroy
    flash[:notice] = "\"#{name}\" was deleted successfully."
    redirect_to @supplier
  else
    flash[:error] = "There was an error deleting the supplier"
    render :show
  end
end

end
