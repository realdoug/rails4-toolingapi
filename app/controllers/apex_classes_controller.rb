class ApexClassesController < ApplicationController
  #comment the below method until i figure out how to implement it
  before_action :set_apex_class, only: [:edit, :update, :destroy]

  # GET /apex_classes
  # GET /apex_classes.json
  def index
    @apex_classes = sfdc_client.query "SELECT Id, Name FROM ApexClass"
  end

  ## Show method isn't really necessary here
  #
  # GET /apex_classes/1
  # GET /apex_classes/1.json
  # def show
  #   @apex_class = Restforce.tooling(SalesforceUtility.init_args).find("ApexClass", params[:id])
  # end

  # GET /apex_classes/new
  def new
    @apex_class = ApexClass.new
    @apex_class_body = ''
  end

  # GET /apex_classes/1/edit
  def edit
    @apex_class_body = CGI.unescape(@apex_class.Body)
  end

  # POST /apex_classes
  # POST /apex_classes.json
  def create
    @apex_class = ApexClass.new(apex_class_params)

    respond_to do |format|
      if @apex_class.save
        format.html { redirect_to @apex_class, notice: 'Apex class was successfully created.' }
        format.json { render action: 'show', status: :created, location: @apex_class }
      else
        format.html { render action: 'new' }
        format.json { render json: @apex_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apex_classes/1
  # PATCH/PUT /apex_classes/1.json
  def update
    respond_to do |format|
      if @apex_class.update(apex_class_params)
        format.html { redirect_to @apex_class, notice: 'Apex class was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @apex_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apex_classes/1
  # DELETE /apex_classes/1.json
  def destroy
    @apex_class.destroy
    respond_to do |format|
      format.html { redirect_to apex_classes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apex_class
      # @apex_class = ApexClass.find(params[:id])
      @apex_class = sfdc_client.find("ApexClass", params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apex_class_params
      params[:apex_class]
    end

    def sfdc_client
      sfdc_init_args = YAML.load_file('config/salesforce.yml')[Rails.env]
      Restforce.tooling(sfdc_init_args)
    end
end
