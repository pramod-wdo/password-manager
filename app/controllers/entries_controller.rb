class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to root_path, flash: { notice: "Entry created successfully." }
    else
      flash[:alert] = "Sorry, there was an error creating your entry. Please check the form and try again."
      render :new, status: :unprocessable_entity
    end
  end
end
