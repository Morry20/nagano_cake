class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to public_customers_my_page_path(current_customer.id)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.is_deleted = true
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path

  end

  private

   def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:email,:postal_code,:address,:telephone_number,:is_deleted)
   end

   def delete_params
     params.require(:customer).permit(:is_deleted)
   end

end
