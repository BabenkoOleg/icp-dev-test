class ClaimsController < ApplicationController
  before_action :set_claim, only: [:show, :update, :destroy]

  # GET /claims
  def index
    claims = Claim.all
    render json: ClaimSerializer.new(claims)
  end

  # GET /claims/:id
  def show
    render json: ClaimSerializer.new(@claim)
  end

  # POST /claims
  def create
    claim = Claim.new(claim_params)

    if claim.save
      render json: ClaimSerializer.new(claim)
    else
      render json: claim.errors, status: :unprocessable_entity
    end
  end

  # PUT /claims/:id
  def update
    if @claim.update(claim_params)
      render json: ClaimSerializer.new(@claim)
    else
      render json: @claim.errors, status: :unprocessable_entity
    end
  end

  # DELETE /claims/1
  def destroy
    @claim.destroy
    head :ok
  end

  private

  def set_claim
    @claim = Claim.find(params[:id])
  end

  def claim_params
    params.require(:claim)
          .permit(:cap_drop, :data_provided, :likely_bookbuild, :percentage_drop, :price_drop,
                  :signed_losses, :status, :total_potential_income, :current_potential_income,
                  :traded_inflation, :company_id)
  end
end
