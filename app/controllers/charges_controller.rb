require_relative '../../lib/amount.rb'

class ChargesController < ApplicationController
after_action :upgrade_account, only: [:create]

  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Premium Membership - #{current_user.email}",
      amount: Amount.default
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: Amount.default,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    flash[:notice] = "Account upgraded."
    redirect_to wikis_path

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def upgrade_account
    current_user.update_attributes(role: 'premium')
  end

  def destroy
    current_user.update_attributes(role: 'standard')
  end
end
