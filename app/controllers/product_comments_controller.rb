class ProductCommentsController < ApplicationController
  before_action :set_product_comment, only: %i[ show edit update destroy ]

  # GET /product_comments or /product_comments.json
  def index
    @product_comments = ProductComment.all
  end

  # GET /product_comments/1 or /product_comments/1.json
  def show
  end

  # GET /product_comments/new
  def new
    @product_comment = ProductComment.new
  end

  # GET /product_comments/1/edit
  def edit
  end

  # POST /product_comments or /product_comments.json
  def create
    @product_comment = ProductComment.new(product_comment_params)

    respond_to do |format|
      if @product_comment.save
        format.html { redirect_to product_comment_url(@product_comment), notice: "Product comment was successfully created." }
        format.json { render :show, status: :created, location: @product_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_comments/1 or /product_comments/1.json
  def update
    respond_to do |format|
      if @product_comment.update(product_comment_params)
        format.html { redirect_to product_comment_url(@product_comment), notice: "Product comment was successfully updated." }
        format.json { render :show, status: :ok, location: @product_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_comments/1 or /product_comments/1.json
  def destroy
    @product_comment.destroy

    respond_to do |format|
      format.html { redirect_to product_comments_url, notice: "Product comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_comment
      @product_comment = ProductComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_comment_params
      params.require(:product_comment).permit(:product_id, :user_id, :comment)
    end
end
