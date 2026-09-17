class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end
end
