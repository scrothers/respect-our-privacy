class PhonesController < ApplicationController

  def new
    @phone = Phone.new
    respond_to do |format|
      format.html
    end
  end

  def create
    number = params[:phone][:number].tr('^0-9', '')
    @phone = Phone.find_by_number(number);

    if @phone.nil?
      @phone = Phone.new(:number => number)
      @phone.save
    else
      @phone.increment(:requests_count)
    end

    # @phone.call
  end

end