module Api

  class BrandsController < ApplicationController

    def index
      @brands = Brand.all
      #image = rails_blob_url(@brands.brand_image)
      if !@brands.blank?
        render  json: {
          data:@brands
        },status: :ok
      else
        render json: {error: "Markalar listelenemedi !" }, status: :bad_request
      end
    end

    def show
      @brand = set_brand
      image = rails_blob_url(@brand.brand_image)
      if (defined? @brand)
        render :show, status: :ok
      else
        render json: {error: "Marka Bulunamadı !"},status: :bad_request
      end
    end

    def create
      @brand = Brand.create(brand_params)
      if @brand.save
        render json:@brand, status: :created
      else
        render json: "Kayıt Başarısız", status: :bad_request
      end

    end

    def update
      @brand = set_brand
      if @brand.update(brand_params)
        render :show, status: :ok
      else
        render json: {error:"Güncelleme başarısız !"},status: :bad_request
      end
    end

    def destroy
       @brand = set_brand
       if @brand.destroy
        render json: {
          message: "Marka silme başarılı",
          data: @show
        },
        status: :ok
      end
    end

    private

    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params.permit(:name,:brand_image)
    end
  end
end
