class AmorimetrosController < ApplicationController
  before_action :current_user_must_be_amorimetro_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_amorimetro_user
    amorimetro = Amorimetro.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == amorimetro.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @amorimetros = Amorimetro.all

    render("amorimetro_templates/index.html.erb")
  end

  def show
    @amorimetro = Amorimetro.find(params.fetch("id_to_display"))

    render("amorimetro_templates/show.html.erb")
  end

  def new_form
    @amorimetro = Amorimetro.new

    render("amorimetro_templates/new_form.html.erb")
  end

  def create_row
    @amorimetro = Amorimetro.new

    @amorimetro.points = params.fetch("points")
    @amorimetro.user_id = params.fetch("user_id")
    @amorimetro.reason = params.fetch("reason")

    if @amorimetro.valid?
      @amorimetro.save

      redirect_back(:fallback_location => "/amorimetros", :notice => "Amorimetro created successfully.")
    else
      render("amorimetro_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @amorimetro = Amorimetro.find(params.fetch("prefill_with_id"))

    render("amorimetro_templates/edit_form.html.erb")
  end

  def update_row
    @amorimetro = Amorimetro.find(params.fetch("id_to_modify"))

    @amorimetro.points = params.fetch("points")
    
    @amorimetro.reason = params.fetch("reason")

    if @amorimetro.valid?
      @amorimetro.save

      redirect_to("/amorimetros/#{@amorimetro.id}", :notice => "Amorimetro updated successfully.")
    else
      render("amorimetro_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @amorimetro = Amorimetro.find(params.fetch("id_to_remove"))

    @amorimetro.destroy

    redirect_to("/users/#{@amorimetro.user_id}", notice: "Amorimetro deleted successfully.")
  end

  def destroy_row
    @amorimetro = Amorimetro.find(params.fetch("id_to_remove"))

    @amorimetro.destroy

    redirect_to("/amorimetros", :notice => "Amorimetro deleted successfully.")
  end
end
