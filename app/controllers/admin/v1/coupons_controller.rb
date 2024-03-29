module Admin::V1
  class CouponsController < ApiController
    before_action :load_category, only: [:update, :destroy]

    def index
      @coupons = Coupon.all
    end

    def create
      @coupon = Coupon.new
      @coupon.attributes = coupon_params

      save_category!
    end

    def update
      @coupon.attributes = coupon_params

      save_category!
    end

    def destroy
      @coupon.destroy!
    rescue
      render_error(fields: @coupon.errors.messages)
    end

    private

    def load_category
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      return {} unless params.has_key?(:coupon)
      params.require(:coupon).permit(:code, :status, :discount_value, :due_date)
    end

    def save_category!
      @coupon.save!
      render :show
    rescue
      render_error(fields: @coupon.errors.messages)
    end
  end
end