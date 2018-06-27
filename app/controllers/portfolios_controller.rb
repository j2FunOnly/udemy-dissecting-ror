class PortfoliosController < ApplicationController
  def index
    @portfolio_items = if params[:subtitle].present?
      Portfolio.subtitle_items(params[:subtitle])
    else
      Portfolio.all
    end
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new
    3.times { @portfolio.technologies.build }
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save
      redirect_to portfolios_path #, notice: 'Portfolio has been created'
    else
      # flash.now[:notice] = 'Could not create portfolio'
      render :new
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])

    if @portfolio.update(portfolio_params)
      redirect_to portfolios_path
    else
      render :edit
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    redirect_to portfolios_path, notice: 'Record was removed'
  end

  private

  def portfolio_params
    params.require(:portfolio)
      .permit(
        :title,
        :subtitle,
        :body,
        technologies_attributes: [:id, :name]
      )
  end
end
