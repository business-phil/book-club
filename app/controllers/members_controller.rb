# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: %i[show edit update destroy]

  # GET /members
  def index
    @members = Member.all
  end

  # GET /members/1
  def show; end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit; end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy

    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def member_params
    params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
end
