class BusOperatorsController < ApplicationController  
  before_action :set_bus_operator, only: [:show, :edit, :update, :destroy,:qualify, :qualifications]  
  # GET /bus_operators
  # GET /bus_operators.json
  def index           
    #Perform Bus Operators update  
    RecorridoService.new.call
    if bus_operator_params[:criteria]
      @bus_operators = BusOperator.all.order_by(bus_operator_params[:criteria].to_sym => 'desc').page(params[:page].to_i).per(20)
    else
      @bus_operators = BusOperator.all.page(params[:page].to_i).per(20)
    end 
  end

  # GET /bus_operators/1
  # GET /bus_operators/1.json
  def show
  end

  # GET /bus_operators/new
  def new
    @bus_operator = BusOperator.new
  end

  # GET /bus_operators/1/edit
  def edit
  end

  # POST /bus_operators
  # POST /bus_operators.json
  def create
    @bus_operator = BusOperator.new(bus_operator_params)

    respond_to do |format|
      if @bus_operator.save
        format.html { redirect_to @bus_operator, notice: 'Bus operator was successfully created.' }
        format.json { render :show, status: :created, location: @bus_operator }
      else
        format.html { render :new }
        format.json { render json: @bus_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bus_operators/1
  # PATCH/PUT /bus_operators/1.json
  def update
    respond_to do |format|
      if @bus_operator.update(bus_operator_params)
        format.html { redirect_to @bus_operator, notice: 'Bus operator was successfully updated.' }
        format.json { render :show, status: :ok, location: @bus_operator }
      else
        format.html { render :edit }
        format.json { render json: @bus_operator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bus_operators/1
  # DELETE /bus_operators/1.json
  def destroy
    @bus_operator.destroy
    respond_to do |format|
      format.html { redirect_to bus_operators_url, notice: 'Bus operator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /bus_operators/1/qualify
  # Add a new qualification for BusOperator
  def qualify    
    @bus_operator.push(qualifications: {qualification_comment: bus_operator_params[:qualification_comment], qualification: bus_operator_params[:qualification]})
    redirect_to qualifications_bus_operator_url
  end

  # GET /bus_operators/1/qualifications
  # Add a complete list of qualifications for BusOperator
  def qualifications
    @qualifications = Kaminari.paginate_array(@bus_operator.qualifications).page(params[:page]).per(20)    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_operator      
      @bus_operator = BusOperator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bus_operator_params
      params.fetch(:bus_operator, {}).permit(:description, :qualification_comment, :qualification, :criteria)
    end
end
