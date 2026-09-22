class EntriesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.new(entry_params)
    if @entry.save
      redirect_to root_path, flash: { notice: "Entry created successfully." }
    else
      flash[:alert] = "Sorry, there was an error creating your entry. Please check the form and try again."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entry_params
    params.expect(entry: [ :name, :url, :username, :password ])
  end
end
