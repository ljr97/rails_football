class ResultsController < ApplicationController

    def index
        #@results = Result.all
        @results = Result.paginate(page: params[:page])
    end

    def show
        @result = Result.find(params[:id])
    end

    def new 
        @result = Result.new
    end

    def edit
        @result = Result.find(params[:id])
    end

    def create
        @result = Result.new(result_params)

        if @result.save
            redirect_to @result
        else
            render 'new'     
        end
    end

    def update 
        @result = Result.find(params[:id])
        if @result.update(result_params)
            redirect_to @result
        else
            render 'edit'
        end
    end

    def destroy
        @result = Result.find(params[:id])
        @result.destroy
   
        redirect_to results_path
    end

    private
        def result_params
            params.require(:result).permit(:date, :home_team, :away_team, :home_score, :away_score, :tournament, :city, :country, :neutral)
        end
end
