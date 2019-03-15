# frozen_string_literal: true

class ClubsController < ApplicationController
  before_action :set_club, only: %i[show edit update destroy join leave]

  # GET /clubs
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  def show; end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit; end

  # POST /clubs
  def create
    @club = Club.new(club_params.merge(founder: current_user))

    if @club.save
      redirect_to @club, notice: 'Club was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clubs/1
  def update
    if @club.update(club_params)
      redirect_to @club, notice: 'Club was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clubs/1
  def destroy
    @club.destroy

    redirect_to clubs_url, notice: 'Club was successfully destroyed.'
  end

  # PATCH/PUT /clubs/1/join
  def join
    @club.members << current_user unless @club.members.exists?(current_user.id)

    redirect_to @club, notice: 'Successfully joined club.'
  end

  # PATCH/PUT /clubs/1/leave
  def leave
    @club.members.delete(current_user)

    redirect_to clubs_url, notice: 'Successfully left club.'
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name)
  end
end
